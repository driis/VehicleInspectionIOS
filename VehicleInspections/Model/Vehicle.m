#import "Vehicle.h"

@implementation Vehicle
@synthesize registrationNumber = _registrationNumber;
@synthesize vin = _vin;

- (id)initWithJson:(id)json
{
    self = [super init];
    if (self)
    {
        self.registrationNumber = [json objectForKey:@"registrationNumber"];
        self.vin = [json objectForKey:@"vin"];
    }
    return self;
}

@end