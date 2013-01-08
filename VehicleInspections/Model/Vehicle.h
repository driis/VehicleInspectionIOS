#import <Foundation/Foundation.h>


@interface Vehicle : NSObject
@property(nonatomic, retain) NSString* registrationNumber;
@property(nonatomic, retain) NSString* vin;
@property(nonatomic,strong) NSString* model;
@property(nonatomic,strong) NSString*make;
- (id)initWithJson:(id)json;
@end