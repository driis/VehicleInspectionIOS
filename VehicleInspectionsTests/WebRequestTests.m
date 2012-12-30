#import <SenTestingKit/SenTestingKit.h>
#import "WebRequest.h"
#import "TestHelper.h"

@interface WebRequestTests : SenTestCase
@end

@implementation WebRequestTests
{
}

- (void)setUp
{
}

- (void)tearDown
{
}

- (void)testCanGetNonEmptyResponse
{
    WebRequest * request = [WebRequest issueRequestForUrlString:@"http://www.google.dk" andDelegate:nil];
    [TestHelper waitInRunLoopWhile:^{ return request.busy;}];
}

@end