#import "VehicleViewController.h"
#import "VehicleLookup.h"
#import "Vehicle.h"


@interface VehicleViewController()
@property (nonatomic,strong)VehicleLookup *lookup;
@property (nonatomic,strong)UIActivityIndicatorView *spinner;
@end

@implementation VehicleViewController
{

}

@synthesize registrationNumber = _registrationNumber;
@synthesize lookup = _lookup;
@synthesize registrationLabel = _registrationLabel;
@synthesize vinLabel = _vinLabel;
@synthesize vehicle = _vehicl;
@synthesize spinner = _spinner;

- (void)viewDidLoad
{
    self.lookup = [VehicleLookup new];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.title = self.registrationNumber;
    [self showSpinner];
    [self.lookup vehicleByRegistration:self.registrationNumber callback:^(Vehicle * vehicle){
        NSLog(@"Vehicle: %@", vehicle);
        self.vehicle = vehicle;
        [self updateUI];
    }];
}

- (void)showSpinner
{
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.spinner.center = self.view.center;
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
}

- (void)updateUI
{
    self.registrationLabel.text = self.vehicle.registrationNumber;
    self.vinLabel.text = self.vehicle.vin;
    if (self.spinner)
    {
        [self.spinner stopAnimating];
        [self.spinner removeFromSuperview];
        self.spinner = nil;
    }
}

@end