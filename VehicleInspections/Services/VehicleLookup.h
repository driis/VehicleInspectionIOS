#import <Foundation/Foundation.h>

@class Vehicle;


@interface VehicleLookup : NSObject

- (Vehicle*) vehicleByRegistration:(NSString *)registrationNumber;

@end