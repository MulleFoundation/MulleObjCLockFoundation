/*
 *  MulleFoundation - the mulle-objc class library
 *
 *  NSCondition.m is a part of MulleFoundation
 *
 *  Copyright (C) 2011 Nat!, Mulle kybernetiK.
 *  All rights reserved.
 *
 *  Coded by Nat!
 *
 *  $Id$
 *
 */
// define, that make things POSIXly
#define _XOPEN_SOURCE 700

#import "import-private.h"

#import "NSCondition.h"

// other files in this library

// std-c and dependencies
#include <stdio.h>
#include <math.h>  // for is_inf

//
// this is not done using mulle_thread because I don't want to
// do cond_wait in it. Should check c11 though and maybe
// reconsider.
//
@implementation NSCondition

- (instancetype) init
{
#ifndef  _WIN32
   pthread_mutex_init( &self->_lock, NULL);
   pthread_cond_init(  &self->_condition, NULL);
#endif
   return( self);
}


- (void) dealloc
{
#ifndef  _WIN32
   pthread_cond_destroy( &self->_condition);
   pthread_mutex_destroy( &self->_lock);
#endif
   [super dealloc];
}


static void  rval_perror_abort( char *s, int rval)
{
   errno = rval;
   perror( s);
   abort();
}


- (void) signal
{
#ifndef  _WIN32
   int   rval;

   rval = pthread_cond_signal( &self->_condition);
   assert( ! rval);
#endif
}


- (void) broadcast
{
#ifndef  _WIN32
   int   rval;

   rval = pthread_cond_broadcast( &self->_condition);
   assert( ! rval);
#endif
}


- (void) wait
{
   int   rval;
   // It is important to note that when pthread_cond_wait()
   // and pthread_cond_timedwait() return without error, the associated
   // predicate may still be false
   // (associated predicate -> -[NSConditionLock condition])
   //
#ifndef  _WIN32
   _mulleIsLocked = NO;
   rval = pthread_cond_wait( &self->_condition, &self->_lock);
   if( rval)
      rval_perror_abort( "pthread_cond_wait", rval);
   _mulleIsLocked = YES;
#endif
}


#pragma mark - NSLocking

- (void) lock
{
#ifndef  _WIN32
   int   rval;

   rval = pthread_mutex_lock( &self->_lock);
   assert( ! rval);
#endif

   _mulleIsLocked = YES;
}


- (void) unlock
{
   int   rval;

   _mulleIsLocked = NO;

#ifndef  _WIN32
   rval = pthread_mutex_unlock( &self->_lock);
   assert( ! rval);
#endif
}


- (BOOL) tryLock
{
#ifndef  _WIN32
   int    rval;

   rval = pthread_mutex_trylock( &self->_lock);
   if( rval)
   {
      if( rval == EBUSY)
         return( NO);

      rval_perror_abort( "pthread_mutex_trylock", rval);
   }
#endif
   _mulleIsLocked = YES;
   return( YES);
}


- (BOOL) mulleWaitUntilTimeInterval:(NSTimeInterval) interval
{
#ifndef  _WIN32
   struct timespec   wait_time;
   NSTimeInterval    secondsSince1970;
   int               rval;

   if( isinf( interval))
   {
      _mulleIsLocked = NO;

      [self wait];

      _mulleIsLocked = YES;
      return( YES);
   }

   secondsSince1970  = _NSTimeIntervalSinceReferenceDateAsSince1970( interval);
   wait_time.tv_sec  = (long) secondsSince1970;
   wait_time.tv_nsec = (long) ((secondsSince1970 - wait_time.tv_sec) * (double) (1000.0*1000*1000));
   _mulleIsLocked    = NO;
   rval              = pthread_cond_timedwait( &self->_condition,
                                               &self->_lock,
                                               &wait_time);
   if( rval == ETIMEDOUT)
   {
      // surprisingly, we have to do this... pthread is so strange
      rval = pthread_mutex_unlock( &self->_lock);
      assert( ! rval);
      return( NO);
   }
   if( rval)
      rval_perror_abort( "pthread_cond_timedwait", rval);
#endif

   _mulleIsLocked = YES;
   return( YES);
}


- (BOOL) mulleWaitWithTimeout:(mulle_relativetime_t) seconds
{
   NSTimeInterval   interval;

   interval = _NSTimeIntervalNow() + seconds;
   return( [self mulleWaitUntilTimeInterval:interval]);
}

@end

