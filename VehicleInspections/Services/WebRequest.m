#import "WebRequest.h"
#import "WebResponse.h"

@interface WebRequest()
@property(nonatomic, strong, readwrite) NSURL* url;
@property (nonatomic,strong)NSObject<WebRequestDelegate> *delegate;
@property (nonatomic,strong)NSURLRequest *inner;
@property (nonatomic,strong)NSURLResponse *response;
@property (nonatomic, strong)NSMutableData*responseBody;

@property (nonatomic,strong)NSURLConnection *connection;

@property(nonatomic, readwrite) BOOL busy;

@property(nonatomic, retain, readwrite) NSMutableDictionary* state;

-(WebResponse *)asResponse;
@end

@implementation WebRequest

@synthesize url = _url;
@synthesize delegate = _delegate;
@synthesize inner = _inner;
@synthesize responseBody = _responseBody;
@synthesize response = _response;
@synthesize connection = _connection;

@synthesize busy = _busy;

@synthesize state = _state;

- (id)initWithUrl:(NSURL *)url andDelegate:(NSObject <WebRequestDelegate> *)delegate
{
    if (!url || !delegate)
        return nil;
    
    self = [super init];
    if (self)
    {
        self.busy = NO;
        self.url = url;
        self.delegate = delegate;
        self.state = [NSMutableDictionary new];
    }
    return self;
}

- (void)issueRequest
{
    NSMutableURLRequest * request;
    self.inner = request = [[NSMutableURLRequest alloc] initWithURL:self.url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    self.busy = YES;
    self.connection = [[NSURLConnection alloc] initWithRequest:self.inner delegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.delegate requestFailed:self withError:error andResponse:[self asResponse]];
    self.busy = NO;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.delegate requestSucceeded:self withResponse:[self asResponse]];
    self.busy = NO;
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
    [request issueRequest];
    return request;
}

+ (WebRequest *)issueRequestForUrlString:(NSString *)url andDelegate:(NSObject <WebRequestDelegate> *)delegate
{
    NSURL * realUrl = [[NSURL alloc] initWithString:url];
    return [WebRequest issueRequestForUrl:realUrl andDelegate:delegate];
}

@end