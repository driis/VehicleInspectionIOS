#import "NSArray+Map.h"

@implementation NSArray (Map)
- (NSArray *) map:(MapBlock)mapBlock
{
    NSMutableArray * result = [[NSMutableArray alloc] initWithCapacity:self.count];
    for (id source in self)
        [result addObject:mapBlock(source)];
    return result;
}
@end