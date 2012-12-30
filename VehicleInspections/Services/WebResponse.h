#import <Foundation/Foundation.h>


@interface WebResponse : NSObject
@property (nonatomic,strong) NSData* body;
@property (nonatomic,strong) NSURLResponse * innerResponse;

@end