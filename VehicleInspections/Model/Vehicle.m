#import "Vehicle.h"
#import "VehicleInspection.h"
#import "NSArray+Map.h"

@interface Vehicle()
;
@end

@implementation Vehicle
@synthesize registrationNumber = _registrationNumber;
@synthesize vin = _vin;

@synthesize model = _model;

@synthesize make = _make;

@synthesize inspections = _inspections;

- (id)initWithJson:(id)json
{
    self = [super init];
    if (self)
    {
        self.registrationNumber = [json objectForKey:@"registrationNumber"];
        self.vin = [json objectForKey:@"vin"];
        self.make = [json objectForKey:@"make"];
        self.model = [json objectForKey:@"model"];
        NSArray * inspections = [json objectForKey:@"inspections"];
        self.inspections = [inspections map:^id(id x){
            return [[VehicleInspection alloc] initWithJson:x];
        }];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"VIN %@", self.vin];
}


@end