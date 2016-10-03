//
//  MapPoint.h
//  LocateMe
//
//  Created by Leksha Ramdenee on 2016-10-03.
//  Copyright © 2016 Leksha Ramdenee. All rights reserved.
//

#ifndef MapPoint_h
#define MapPoint_h

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

// A new designated initializer for instances of MapPoint
- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

// This is a required property from MKAnnotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// This is an optional property from MKAnnotation
@property (nonatomic, copy) NSString *title;

@end
#endif /* MapPoint_h */
