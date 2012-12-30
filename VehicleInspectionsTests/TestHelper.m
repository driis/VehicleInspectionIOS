#import "TestHelper.h"


@implementation TestHelper
{

}

+ (void)waitInRunLoopWhile:(BOOL(^))predicate
{
    NSRunLoop * loop = [NSRunLoop mainRunLoop];
    while (predicate())
    {
        [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:500]];
    }
}

@end