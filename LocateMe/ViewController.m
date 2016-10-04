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

- (void)findLocation
{
    [locationManager startUpdatingLocation];
    [_activityIndicator startAnimating];
    [_locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    // Create an instance of MapPoint with the current data
    MapPoint *mp = [[MapPoint alloc] initWithCoordinate:coord title:[_locationTitleField text]];
    
    // Add it to the map view
    [_worldView addAnnotation:mp];
    
    // Zoom the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [_worldView setRegion:region animated:YES];
    
    [_locationTitleField setText:@"Found region!"];
    [_activityIndicator stopAnimating];
    [_locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"New Location: %@", newLocation);
    
    // How many second ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    // CLLocationManagers will return the last found location of the device fist,
    // you don't want that data in this case.
    // If this location was made more than 3 mins ago, ignore it.
    if (t < -180) {
        // This is cached data, you don't want it, keep looking
        return;
    }
    [self foundLocation:newLocation];
    
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
    [self findLocation];
    
    [textField resignFirstResponder];
    return YES;
}

@end
