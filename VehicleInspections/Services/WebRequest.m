#import "WebRequest.h"
#import "WebResponse.h"


@interface WebRequest()
@property(nonatomic, strong, readwrite) NSURL* url;
@property (nonatomic,strong)NSObject<WebRequestDelegate> *delegate;
@property (nonatomic,strong)NSURLRequest *inner;
@end

@implementation WebRequest

@synthesize url = _url;
@synthesize delegate = _delegate;
@synthesize inner = _inner;

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
    [[NSURLConnection alloc] initWithRequest:self.inner delegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{

}



#pragma mark Utility class methods

+ (WebRequest *)issueRequestForUrl:(NSURL *)url andDelegate:(NSObject <WebRequestDelegate> *)delegate
{
    WebRequest * request = [[WebRequest alloc] initWithUrl:url andDelegate:delegate];
    return request;
}

+ (WebRequest *)issueRequestForUrlString:(NSString *)url andDelegate:(NSObject <WebRequestDelegate> *)delegate
{
    NSURL * realUrl = [[NSURL alloc] initWithString:url]:
    return [WebRequest issueRequestForUrl:realUrl andDelegate:delegate];
}

@end