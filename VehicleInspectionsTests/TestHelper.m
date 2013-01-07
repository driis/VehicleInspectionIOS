#import "TestHelper.h"


@implementation TestHelper
{
}

+ (void)waitInRunLoopWhile:(BOOL (^)())predicate
{
    [TestHelper waitInRunLoopWhile:predicate timeout:5];
}

+ (void)waitInRunLoopWhile:(BOOL(^)())predicate timeout:(int)timeout
{
    NSRunLoop * loop = [NSRunLoop mainRunLoop];
    while (predicate())
    {
        [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:timeout]];
    }
}

@end