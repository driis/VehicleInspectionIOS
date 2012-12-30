//
//  ViewController.h
//  VehicleInspections
//
//  Created by Riis, Dennis on 12/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction) registrationNumberChanged:(id) sender;

@property(nonatomic, retain) IBOutlet UIBarButtonItem *searchButton;
@property(nonatomic, retain) IBOutlet UITextField * searchField;

@end