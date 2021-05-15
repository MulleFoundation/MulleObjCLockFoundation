/*
 *  MulleFoundation - the mulle-objc class library
 *
 *  NSConditionLock.m is a part of MulleFoundation
 *
 *  Copyright (C) 2011 Nat!, Mulle kybernetiK.
 *  All rights reserved.
 *
 *  Coded by Nat!
 *
 *  $Id$
 *
 */
#define _GNU_SOURCE

#import "NSConditionLock.h"

// other files in this library

// other libraries of MulleObjCPosixFoundation

// std-c and dependencies


@implementation NSConditionLock

- (instancetype) initWithCondition:(NSInteger) value
{
   [super init];
   _mulle_atomic_pointer_nonatomic_write( &_currentCondition, (void *) value);
   return( self);
}


- (NSInteger) condition
{
   return( (NSUInteger) _mulle_atomic_pointer_read( &_currentCondition));
}


- (void) lockWhenCondition:(NSInteger) value
{
   [self lock];
   while( value != (NSUInteger) _mulle_atomic_pointer_nonatomic_read( &_currentCondition))
      [self wait];
}



- (BOOL) tryLockWhenCondition:(NSInteger) value
{
   if( ! [self tryLock])
      return( NO);

   if( value == (NSInteger) _mulle_atomic_pointer_nonatomic_read( &_currentCondition))
      return( YES);

   [self unlock];
   return( NO);
}


- (void) unlockWithCondition:(NSInteger) value
{
   _mulle_atomic_pointer_nonatomic_write( &_currentCondition, (void *) value);

   //
   // so we broadcast here, because if we only signal we could signal a thread
   // that doesn't really care and then nothing goes anymore ?
   //
   [self broadcast];
   [self unlock];
}


- (void) mulleUnlockWithCondition:(NSInteger) value
                        broadcast:(BOOL) broadcast
{
   _mulle_atomic_pointer_nonatomic_write( &_currentCondition, (void *) value);

   //
   // so we broadcast here, because if we only signal we could signal a thread
   // that doesn't really care and then nothing goes anymore ?
   //
   if( broadcast)
      [self broadcast];
   else
      [self signal];
   [self unlock];
}



- (BOOL) lockWhenCondition:(NSInteger) value
        beforeTimeInterval:(mulle_timeinterval_t) timeInterval
{
   while( ! [self tryLock])
   {
      if( mulle_timeinterval_now() >= timeInterval)
         return( NO);
      mulle_thread_yield();
   }

   // now we are locked and can wait on the condition
   while( value != (NSUInteger) _mulle_atomic_pointer_nonatomic_read( &_currentCondition))
      if( ! [self waitUntilTimeInterval:timeInterval])
         return( NO);
   return( YES);
}


// this does it more like the pthread documentation says
- (BOOL) mulleLockWhenCondition:(NSInteger) value
             beforeTimeInterval:(mulle_timeinterval_t) timeInterval
{
   [self lock];
   while( value != (NSUInteger) _mulle_atomic_pointer_nonatomic_read( &_currentCondition))
      if( ! [self waitUntilTimeInterval:timeInterval])
         return( NO);
   return( YES);
}


- (BOOL) lockBeforeTimeInterval:(mulle_timeinterval_t) timeInterval
{
   return( [self waitUntilTimeInterval:timeInterval]);
}

@end


