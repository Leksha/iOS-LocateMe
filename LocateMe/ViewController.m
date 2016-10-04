//
//  ViewController.m
//  LocateMe
//
//  Created by Leksha Ramdenee on 2016-10-03.
//  Copyright © 2016 Leksha Ramdenee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager requestAlwaysAuthorization];
    
    [_worldView setDelegate:self];
    [_worldView setShowsUserLocation:YES];
    
    [_locationTitleField setDelegate:self];
    
//    [_worldView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [_worldView setRegion:region animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // This method isn't implemented yet - but will son
//    [self findLocation];
    
    [textField resignFirstResponder];
    return YES;
}

@end
