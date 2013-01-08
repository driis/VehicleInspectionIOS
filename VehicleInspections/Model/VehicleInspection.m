#import "VehicleInspection.h"


@implementation VehicleInspection
{

}
@synthesize result = _result;
@synthesize registrationNumber = _registrationNumber;
@synthesize mileage = _mileage;

@synthesize date = _date;

- (id)initWithJson:(id)json
{
    self = [super init];
    if (self)
    {
        self.registrationNumber = [json objectForKey:@"registrationNumber"];
        self.mileage = [json objectForKey:@"mileage"];
        self.result = [json objectForKey:@"result"];
        NSString * date = [json objectForKey:@"date"];
        NSScanner* scanner = [NSScanner scannerWithString:date];
        [scanner setScanLocation:6];
        long long ticks = 0;
        if ( [scanner scanLongLong:&ticks] )
        {
            self.date = [NSDate dateWithTimeIntervalSince1970:ticks/1000];
        }
    }
    return self;
}

@end