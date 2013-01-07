#import <Foundation/Foundation.h>


@interface TestHelper : NSObject

+ (void)waitInRunLoopWhile:(BOOL(^)())predicate;

+(void)waitInRunLoopWhile:(BOOL (^)())predicate timeout:(int)timeout;
@end