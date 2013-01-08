#import "Vehicle.h"

@interface Vehicle()
;
@end

@implementation Vehicle
@synthesize registrationNumber = _registrationNumber;
@synthesize vin = _vin;

@synthesize model = _model;

@synthesize make = _make;

- (id)initWithJson:(id)json
{
    self = [super init];
    if (self)
    {
        self.registrationNumber = [json objectForKey:@"registrationNumber"];
        self.vin = [json objectForKey:@"vin"];
        self.make = [json objectForKey:@"make"];
        self.model = [json objectForKey:@"model"];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"VIN %@", self.vin];
}


@end