#import "VehicleInspection.h"


@implementation VehicleInspection
{

}
@synthesize result = _result;
@synthesize registrationNumber = _registrationNumber;
@synthesize mileage = _mileage;

- (id)initWithJson:(id)json
{
    self = [super init];
    if (self)
    {
        self.registrationNumber = [json objectForKey:@"registrationNumber"];
        self.mileage = [json objectForKey:@"mileage"];
        self.result = [json objectForKey:@"result"];
    }
    return self;
}

@end