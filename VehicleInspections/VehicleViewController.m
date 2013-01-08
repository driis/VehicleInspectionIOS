#import "VehicleViewController.h"
#import "VehicleLookup.h"
#import "Vehicle.h"
#import "InspectionsTableViewController.h"


@interface VehicleViewController()
@property (nonatomic,strong)VehicleLookup *lookup;
@property (nonatomic,strong)UIActivityIndicatorView *spinner;
@property (nonatomic,strong)InspectionsTableViewController *tableViewDelegate;
@end

@implementation VehicleViewController

@synthesize registrationNumber = _registrationNumber;
@synthesize lookup = _lookup;
@synthesize registrationLabel = _registrationLabel;
@synthesize vinLabel = _vinLabel;
@synthesize vehicle = _vehicl;
@synthesize spinner = _spinner;
@synthesize modelLabel = _modelLabel;
@synthesize makeLabel = _makeLabel;
@synthesize tableView = _tableView;

@synthesize tableViewDelegate = _tableViewDelegate;

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
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.spinner.center = self.view.center;
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
}

- (void)updateUI
{
    self.registrationLabel.text = self.vehicle.registrationNumber;
    self.vinLabel.text = self.vehicle.vin;
    self.makeLabel.text = self.vehicle.make;
    self.modelLabel.text = self.vehicle.model;
    self.tableViewDelegate = [[InspectionsTableViewController alloc] initWithVehicle:self.vehicle];
    [self.tableView setDelegate:self.tableViewDelegate];
    [self.tableView setDataSource:self.tableViewDelegate];
    [self.tableView reloadData];
    if (self.spinner)
    {
        [self.spinner stopAnimating];
        [self.spinner removeFromSuperview];
        self.spinner = nil;
    }
}

@end