#import "Foo.h"

#include <stdio.h>


@interface Foo( C2)
@end

@implementation Foo( C2)

+ (void) load
{
    printf( "Foo( C2)\n");
}

+ (struct _mulle_objc_dependency *) dependencies
{
   static struct _mulle_objc_dependency  dependencies[] =
   {
      { @selector( Foo), @selector( C3) },
      0
   };

   return( dependencies);
}

@end
