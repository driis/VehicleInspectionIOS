#import "VehicleViewController.h"
#import "VehicleLookup.h"
#import "Vehicle.h"


@interface VehicleViewController()
@property (nonatomic,strong)VehicleLookup *lookup;
@end

@implementation VehicleViewController
{

}

@synthesize registrationNumber = _registrationNumber;
@synthesize lookup = _lookup;
@synthesize registrationLabel = _registrationLabel;
@synthesize vinLabel = _vinLabel;
@synthesize vehicle = _vehicl;

- (void)viewDidLoad
{
    self.lookup = [VehicleLookup new];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.title = self.registrationNumber;
    [self.lookup vehicleByRegistration:self.registrationNumber callback:^(Vehicle * vehicle){
        NSLog(@"Vehicle: %@", vehicle);
        self.vehicle = vehicle;
        [self updateUI];
    }];
}

- (void)updateUI
{
    self.registrationLabel.text = self.vehicle.registrationNumber;
    self.vinLabel.text = self.vehicle.vin;
}

@end