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
    [_worldView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
