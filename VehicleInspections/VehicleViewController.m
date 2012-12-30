#import "VehicleViewController.h"


@implementation VehicleViewController
{

}

@synthesize registrationNumber = _registrationNumber;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.title = self.registrationNumber;
}

@end