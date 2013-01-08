#import "InspectionsTableViewController.h"
#import "Vehicle.h"
#import "VehicleInspection.h"


@implementation InspectionsTableViewController
{

}
@synthesize vehicle = _vehicle;

- (id)initWithVehicle:(Vehicle *)vehicle
{
    self = [super init];
    if (self)
    {
        self.vehicle = vehicle;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"inspectionCell"];
    }

    cell.textLabel.text = inspection.result;
    cell.detailTextLabel.text = [inspection.mileage stringByAppendingString:@" km"];
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