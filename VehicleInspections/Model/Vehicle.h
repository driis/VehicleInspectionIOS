#import <Foundation/Foundation.h>


@interface Vehicle : NSObject
@property(nonatomic, retain) NSString* registrationNumber;
@property(nonatomic, retain) NSString* vin;

- (id)initWithJson:(id)json;
@end