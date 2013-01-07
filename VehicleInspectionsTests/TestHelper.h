#import <Foundation/Foundation.h>


@interface TestHelper : NSObject

+ (void)waitInRunLoopWhile:(BOOL(^)())predicate;

@end