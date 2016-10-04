//
//  MapPoint.m
//  LocateMe
//
//  Created by Leksha Ramdenee on 2016-10-03.
//  Copyright © 2016 Leksha Ramdenee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapPoint.h"

@implementation MapPoint

@synthesize coordinate, title, dateCreated;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if (self){
        coordinate = c;
        [self setTitle:t];
        dateCreated = [NSDate date];
    }
    return self;
}

@end
