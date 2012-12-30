#import "WebRequest.h"
#import "WebResponse.h"

@interface WebRequest()
@property(nonatomic, strong, readwrite) NSURL* url;
@property (nonatomic,strong)NSObject<WebRequestDelegate> *delegate;
@property (nonatomic,strong)NSURLRequest *inner;
@property (nonatomic,strong)NSURLResponse *response;
@property (nonatomic, strong)NSMutableData*responseBody;

@property (nonatomic,strong)NSURLConnection *connection;

-(WebResponse *)asResponse;
@end

@implementation WebRequest

@synthesize url = _url;
@synthesize delegate = _delegate;
@synthesize inner = _inner;
@synthesize responseBody = _responseBody;
@synthesize response = _response;
@synthesize connection = _connection;

- (id)initWithUrl:(NSURL *)url andDelegate:(NSObject <WebRequestDelegate> *)delegate
{
    if (!url || !delegate)
        return nil;
    
    self = [super init];
    if (self)
    {
        self.url = url;
        self.delegate = delegate;
    }
    return self;
}

- (void)issueRequest
{
    self.inner = [[NSURLRequest alloc] initWithURL:self.url];
    self.connection = [[NSURLConnection alloc] initWithRequest:self.inner delegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.delegate requestFailed:self withError:error andResponse:[self asResponse]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.delegate requestSucceeded:self withResponse:[self asResponse]];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (!_responseBody)
    {
        _responseBody = [[NSMutableData alloc] initWithData:data];
    }
    else
    {
        [_responseBody appendData:data];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.response = response;
}

- (WebResponse *)asResponse
{
    WebResponse * response = [WebResponse new];
    response.body = self.responseBody;
    response.innerResponse = self.response;
    return response;
}

#pragma mark Utility class methods

+ (WebRequest *)issueRequestForUrl:(NSURL *)url andDelegate:(NSObject <WebRequestDelegate> *)delegate
{
    WebRequest * request = [[WebRequest alloc] initWithUrl:url andDelegate:delegate];
    return request;
}

+ (WebRequest *)issueRequestForUrlString:(NSString *)url andDelegate:(NSObject <WebRequestDelegate> *)delegate
{
    NSURL * realUrl = [[NSURL alloc] initWithString:url];
    return [WebRequest issueRequestForUrl:realUrl andDelegate:delegate];
}

@end