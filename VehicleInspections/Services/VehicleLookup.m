#import "VehicleLookup.h"
#import "Vehicle.h"
#import "WebRequest.h"
#import "WebResponse.h"

#define ApiRoot @"http://vehicleinspections.apphb.com/api/v1/"

@implementation VehicleLookup

- (void)vehicleByRegistration:(NSString *)registrationNumber callback:(void (^)(Vehicle *))successCallback
{
    NSString * url = [ApiRoot stringByAppendingFormat:@"vehicle/registration/%@", registrationNumber];
    WebRequest * request = [WebRequest issueRequestForUrlString:url andDelegate:self];
    [request.state setObject:successCallback forKey:@"callback"];
}

- (void)requestSucceeded:(WebRequest *)request withResponse:(WebResponse *)response
{
    NSError * error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:response.body options:NSJSONReadingAllowFragments error:&error];
    if (error)
    {
        [self requestFailed:request withError:error andResponse:response];
        return;
    }
    void(^callback )(Vehicle*) = [request.state objectForKey:@"callback"];
    Vehicle * vehicle = [[Vehicle alloc] initWithJson:json];
    callback(vehicle);
}

- (void)requestFailed:(WebRequest *)request withError:(NSError *)error andResponse:(WebResponse *)response
{
    NSLog(@"Request Failed: %@\nError:%@", request.url, error);
}


@end