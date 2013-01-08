#import <CoreGraphics/CoreGraphics.h>
#import "InspectionsTableViewController.h"
#import "Vehicle.h"
#import "VehicleInspection.h"
#import "InspectionTableViewCell.h"


@interface InspectionsTableViewController()
@property (nonatomic,strong)NSDateFormatter *dateFormatter;
@end

@implementation InspectionsTableViewController
{

}
@synthesize vehicle = _vehicle;
@synthesize dateFormatter = _dateFormatter;

- (id)initWithVehicle:(Vehicle *)vehicle
{
    self = [super init];
    if (self)
    {
        self.vehicle = vehicle;
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"dd/MM yyyy";
    }

    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.vehicle.inspections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VehicleInspection* inspection = [self.vehicle.inspections objectAtIndex:(NSUInteger) indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"inspectionCell"];
    if (cell == nil)
    {
        cell = [[InspectionTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"inspectionCell"];
    }

    NSString *dateString = [self.dateFormatter stringFromDate:inspection.date];

    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", dateString, inspection.result];
    NSString *detailText = [NSString stringWithFormat:@"%@ km", inspection.mileage];
    cell.detailTextLabel.text = detailText;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Synshistorik";
}


@end