#import <Foundation/Foundation.h>

@class Vehicle;


@interface InspectionsTableViewController : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) Vehicle* vehicle;

- (id)initWithVehicle:(Vehicle *)vehicle;

@end