#import <Foundation/Foundation.h>

@protocol JsonDeserializer;


@interface JsonDynamicParser : NSObject
- (id)initWithDeserializer:(NSObject<JsonDeserializer>*) deserializer;
- (id)parseData:(NSData *)data;
- (id)parseString:(NSString *)string;
@end