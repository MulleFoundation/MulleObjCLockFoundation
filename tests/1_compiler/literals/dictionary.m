#include <mulle_objc/mulle_objc.h>

#include <stdio.h>


@interface NSDictionary

+ (id) dictionaryWithObjects:(id *) objects
                     forKeys:(id *) keys
                       count:(long) count;
@end


@implementation NSDictionary

+ (id) dictionaryWithObjects:(id *) objects
                     forKeys:(id *) keys
                       count:(long) count
{
   printf( "%ld\n", count);
}

@end


main()
{
   id   foo;

   foo = @{ @"foo" : @"bar" };
   // just be happy that it compiles :)
}

