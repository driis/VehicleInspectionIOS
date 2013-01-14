#import <Foundation/Foundation.h>

@protocol JsonDeserializer
- (id) deserializeFromData:(NSData *) data;
@end