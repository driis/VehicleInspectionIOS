#import "NSJsonDeserializer.h"


@implementation NSJsonDeserializer
{

}
- (id)deserializeFromData:(NSData *)data
{
    NSError * error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error)
    {
        NSDictionary * errorDictionary = [NSDictionary dictionaryWithObject:error forKey:@"error"];
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to deserialize JSON" userInfo:errorDictionary];
    }
    return json;
}

@end