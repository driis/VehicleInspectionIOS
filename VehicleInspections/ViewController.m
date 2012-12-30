//
//  ViewController.m
//  VehicleInspections
//
//  Created by Riis, Dennis on 12/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "VehicleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize searchField = _searchField;

@synthesize searchButton = _searchButton;

- (void)viewDidLoad
{
    self.title = @"Synsopslag";
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setSearchEnabledState:self.searchField];
}

- (IBAction)registrationNumberChanged:(id)sender
{
    [self setSearchEnabledState:sender];
}

- (void)setSearchEnabledState:(UITextField *)registrationTextField
{
    BOOL canSearch = registrationTextField.text.length > 0;
    self.searchButton.enabled = canSearch;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * registrationNumber = self.searchField.text;
    registrationNumber = [registrationNumber uppercaseString];
    VehicleViewController* target = segue.destinationViewController;
    target.registrationNumber = registrationNumber;
}

@end