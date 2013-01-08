#import <Foundation/Foundation.h>

typedef id(^MapBlock)(id);

@interface NSArray (Map)
- (NSArray *) map:(MapBlock)mapBlock;
@end
