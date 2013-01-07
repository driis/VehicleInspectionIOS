#import <Foundation/Foundation.h>

@class VehicleLookup;
@class Vehicle;


@interface VehicleViewController : UIViewController
@property(nonatomic, copy) NSString * registrationNumber;
@property(nonatomic, retain) Vehicle * vehicle;
@property(nonatomic, retain) IBOutlet UILabel *registrationLabel;
@property(nonatomic, retain) IBOutlet UILabel *vinLabel;
@end