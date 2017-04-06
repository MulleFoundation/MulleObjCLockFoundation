#include <mulle_objc/mulle_objc.h>


@interface NSException
@end


@interface NSOtherException : NSException
@end


@implementation NSException

+ (id) new
{
   return( [mulle_objc_class_alloc_instance( self, NULL) init]);
}


- (id) init
{
   return( self);
}

@end


@implementation NSOtherException
@end


main()
{
   NSException   *exception;
   @try
   {
      printf( "@try\n");
      @throw( [NSOtherException new]);
   }
   @catch( NSOtherException *exception)
   {
      printf( "@catch NSOtherException\n");
   }
   @catch( NSException *exception)
   {
      printf( "@catch NSException\n");
   }
   @finally
   {
      printf( "@finally\n");
   }
}


