#import <SenTestingKit/SenTestingKit.h>
#import "WebRequest.h"
#import "TestHelper.h"
#import "WebResponse.h"

@interface WebRequestTests : SenTestCase <WebRequestDelegate>
@property(nonatomic, retain) WebResponse * response;
@end

@implementation WebRequestTests
{
}

@synthesize response = _response;

- (void)setUp
{
    self.response = nil;
}

- (void)tearDown
{
}

- (void)testCanGetNonEmptyResponse
{
    WebRequest * request = [WebRequest issueRequestForUrlString:@"http://www.google.dk" andDelegate:self];
    [TestHelper waitInRunLoopWhile:^{ return request.busy;}];

    STAssertNotNil(self.response,@"Response was nil");
    STAssertTrue(self.response.body.length > 100, @"Incomplete response returned.");
}

- (void)requestSucceeded:(WebRequest *)request withResponse:(WebResponse *)response
{
    self.response = response;
}

- (void)requestFailed:(WebRequest *)request withError:(NSError *)error andResponse:(WebResponse *)response
{
    STAssertTrue(NO, @"Failed callback was called.");
}


@end