#import <SenTestingKit/SenTestingKit.h>
#import "NSJsonDeserializer.h"
#import "JsonDynamicParser.h"
#import "Dummy.h"

#define someJson @"{\"foo\":42,\"bar\":{\"fooBar\":\"interesting\"}}"


@interface JsonDynamicParserTests : SenTestCase
@property (nonatomic, strong) JsonDynamicParser* parser;
@end

@implementation JsonDynamicParserTests
{
}

@synthesize parser = _parser;

- (void)setUp
{
    self.parser = [[JsonDynamicParser alloc] initWithDeserializer:[NSJsonDeserializer new]];
}

- (void)testCanDeserializeSomeJson
{
    NSJsonDeserializer* deserializer = [NSJsonDeserializer new];
    id data = [deserializer deserializeFromData:[someJson dataUsingEncoding:NSASCIIStringEncoding]];
    STAssertTrue([data isKindOfClass:[NSDictionary class]], @"Returned object was not an NSDictionary");
}

- (void)testCanGetDynamicObject
{
    Dummy * data = [self.parser parseString:someJson];

    NSString * result = data.foo;
    STAssertEqualObjects(@"42", result, @"Expected property was not forwarded correctly.");
}

@end