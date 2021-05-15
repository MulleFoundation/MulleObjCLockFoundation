/*
 *  MulleFoundation - the mulle-objc class library
 *
 *  NSCondition.h is a part of MulleFoundation
 *
 *  Copyright (C) 2011 Nat!, Mulle kybernetiK.
 *  All rights reserved.
 *
 *  Coded by Nat!
 *
 *  $Id$
 *
 */
#import "import.h"

#include <pthread.h>

#import "NSLocking.h"

//
// This is the basis for NSConditionLock. On its own its just a thin wrapper
// around pthreads. Its super lowlevel and you really must have read the
// pthread dox, otherwise you'll be deadlocking left and right.
// Hint: Use NSConditionLock or pthreads directly if possible.
//
@interface NSCondition : NSObject < NSLocking>
{
   pthread_mutex_t   _lock;
   pthread_cond_t    _condition;
}

// it's an NSString, but we don't have it here
@property( copy) id   name;


- (void) signal;
- (void) broadcast;

// these two can spuriously return, even if the condition was signaled
// enter locked
- (void) wait;

//
// this is a BOOL: if you get NO, you know that limit has been reached
// Enter here in a locked state, unlock afterwards.
// mulle_timeinterval_t is same as NSTimeInterval, but we don't have the
// type here yet
- (BOOL) waitUntilTimeInterval:(mulle_timeinterval_t) timeinterval;
- (BOOL) mulleWaitUntilTimeIntervalSince1970:(mulle_timeinterval_t) interval;

- (BOOL) tryLock;

@end


