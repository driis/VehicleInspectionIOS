#import <Foundation/Foundation.h>
#import "WebRequest.h"

@class Vehicle;


@interface VehicleLookup : NSObject<WebRequestDelegate>

- (void)vehicleByRegistration:(NSString *)registrationNumber callback:(void(^)(Vehicle *))block;

@end