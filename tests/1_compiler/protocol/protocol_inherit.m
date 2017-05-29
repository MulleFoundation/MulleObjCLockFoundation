#include <mulle_objc/mulle_objc.h>

@protocol  A      // 0x7fc56270e7a70fa8
@end

@protocol  B < A>   // 0x9d5ed678fe57bcca
@end


// the compiler should emit <A, B> here
@interface Foo <B>
@end


@implementation Foo

+ (Class) class
{
  return( self);
}

@end


main()
{
   Class   cls;

   cls = [Foo class];
   printf( "A: %s\n",
       _mulle_objc_infraclass_conformsto_protocol( cls,
                                              @protocol( A)) ? "YES" : "NO");
   printf( "B: %s\n",
       _mulle_objc_infraclass_conformsto_protocol( cls,
                                              @protocol( B)) ? "YES" : "NO");
   mulle_objc_dotdump_runtime_to_tmp();
}
