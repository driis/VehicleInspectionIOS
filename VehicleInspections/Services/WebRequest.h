#import <Foundation/Foundation.h>
@class WebRequest;
@class WebResponse;

@protocol WebRequestDelegate <NSObject>
- (void) requestSucceeded:(WebRequest*)request withResponse:(WebResponse*)response;
- (void) requestFailed:(WebRequest *)request withError:(NSError *)error andResponse:(WebResponse*)response;
@end

@interface WebRequest : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property(nonatomic, strong, readonly) NSURL* url;
@property(nonatomic, readonly) BOOL busy;
- (id) initWithUrl:(NSURL *)url andDelegate:(NSObject<WebRequestDelegate> *)delegate;
- (void) issueRequest;

+ (WebRequest *)issueRequestForUrl:(NSURL *)  url andDelegate:(NSObject<WebRequestDelegate> *)delegate;
+ (WebRequest *)issueRequestForUrlString:(NSString*)url andDelegate:(NSObject<WebRequestDelegate> *)delegate;
@end