#import <Foundation/Foundation.h>
#include <objc/runtime.h>
#import "JsonDynamicParser.h"
#import "JsonDeserializer.h"
#import "NSArray+Map.h"

@interface _JsonDynamicObject : NSObject
- (id)initWithDictionary:(NSDictionary *)inner;
+(id)lookupToDynamicObject:(id)obj;
@property (nonatomic, strong) NSDictionary* inner;
@end

id lookupImplementation(_JsonDynamicObject * self, SEL cmd)
{
    NSString * key = NSStringFromSelector(cmd);
    id obj = [self.inner objectForKey:key];
    return [_JsonDynamicObject lookupToDynamicObject:obj];
}

@implementation _JsonDynamicObject
@synthesize inner = _inner;
- (id)initWithDictionary:(NSDictionary *)inner
{
    self = [super init];
    if (self)
    {
        self.inner = inner;
    }
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    BOOL canRespond =
            [self hasKeyForSelector:aSelector] ||
            [self.inner respondsToSelector:aSelector] ||
            [super respondsToSelector:aSelector];
    return canRespond;
}

- (id)performSelector:(SEL)aSelector
{
    NSString *selectorName = NSStringFromSelector(aSelector);
    id obj = [self.inner objectForKey:selectorName];
    if (!obj && [self.inner respondsToSelector:aSelector])
        return [self.inner performSelector:aSelector];
    return [_JsonDynamicObject lookupToDynamicObject:obj];
}

- (BOOL)hasKeyForSelector:(SEL)aSelector
{
    NSString *selectorName = NSStringFromSelector(aSelector);
    return [self.inner objectForKey:selectorName] != nil;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selectorName = NSStringFromSelector(sel);
    if ( [selectorName rangeOfString:@":"].location == NSNotFound )
    {
        class_addMethod([self class], sel, (IMP) &lookupImplementation, "@@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}


+ (id)lookupToDynamicObject:(id)obj
{
    if ([obj isKindOfClass:[NSString class]])
        return obj;
    if ([obj isKindOfClass:[NSArray class]])
    {
        return [obj map:^(id instance){
            return [_JsonDynamicObject lookupToDynamicObject:obj];
        }];
    }
    if ([obj isKindOfClass:[NSDictionary class]])
        return [[_JsonDynamicObject alloc] initWithDictionary:obj];

    return nil;
}

@end

@interface JsonDynamicParser()
@property (nonatomic,strong)NSObject<JsonDeserializer> *deserializer;
@end

@implementation JsonDynamicParser
@synthesize deserializer = _deserializer;

- (id)initWithDeserializer:(NSObject <JsonDeserializer>*)deserializer
{
    self = [super init];
    if (self)
    {
        self.deserializer = deserializer;
    }
    return self;
}

- (id)parseData:(NSData *)data
{
    id lookup = [self.deserializer deserializeFromData:data];
    return [_JsonDynamicObject lookupToDynamicObject:lookup];
}

- (id)parseString:(NSString *)string
{
    return [self parseData:[string dataUsingEncoding:NSUTF8StringEncoding]];
}


@end