#import <Foundation/Foundation.h>


@interface VehicleInspection : NSObject
@property(nonatomic, retain) NSString *registrationNumber;
@property(nonatomic, retain) NSString *result;
@property(nonatomic, retain) NSString *mileage;
@property(nonatomic, retain) NSDate* date;

- (id)initWithJson:(id)json;
@end