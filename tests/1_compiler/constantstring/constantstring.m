#define __MULLE_OBJC_NO_TPS__

#include <mulle_objc/mulle_objc.h>


// no support for the package keyword
@interface SomeString
{
   char  *_s;
   int   _len;
}
@end

SomeString  *foo = @"foo";
SomeString  *bar = @"bar";


@implementation SomeString

+ (Class) class
{
   return( self);
}


- (void) print
{
   if( self == foo)
      printf( "foo: ");
   if( self == bar)
      printf( "bar: ");

   printf( "%d: %s\n", self->_len, self->_s);
}

@end


main()
{
   struct _mulle_objc_runtime   *runtime;


   runtime = mulle_objc_get_runtime();

   _mulle_objc_runtime_set_staticstringclass( runtime, [SomeString class]);

   mulle_objc_dotdump_runtime_to_tmp();

   [foo print];
   [bar print];
   [@"foo" print];

   return( 0);
}
