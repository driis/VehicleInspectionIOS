#import <SenTestingKit/SenTestingKit.h>
#import "VehicleLookup.h"
#import "Vehicle.h"
#import "TestHelper.h"

@interface VehicleLookupTests : SenTestCase
@end

@implementation VehicleLookupTests
{
}

- (void)setUp
{
}

- (void)tearDown
{
}

- (void) testGetByRegistration_CanGetVehicle
{
    VehicleLookup * lookup = [[VehicleLookup alloc] init];
    __block Vehicle * result;
    [lookup vehicleByRegistration:@"XK95962" callback:^(Vehicle * vehicle){
        result = vehicle;
    }];
    [TestHelper waitInRunLoopWhile:^BOOL{ return result == nil;}];

    STAssertNotNil(result, @"Result not set.");
    STAssertEqualObjects(@"XK95962", result.registrationNumber, @"Registration number wrong");
    STAssertEqualObjects(@"WVWZZZ1HZSW218578", result.vin, @"VIN wrong");
}

@end