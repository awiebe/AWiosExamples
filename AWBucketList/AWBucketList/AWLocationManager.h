//
//  AWLocationManager.h
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-03-28.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface AWLocationManager : NSObject <CLLocationManagerDelegate>
{
    
}
- (void)startUpdatingCurrentLocation;
- (void)stopUpdatingCurrentLocation;
- (NSString*)currentLocation;
- (BOOL) ready;
- (void)clear;

@property (retain) CLLocationManager* locationManager;
@property (retain) CLGeocoder *geocoder;
@property (assign) CLLocationCoordinate2D currentUserCoordinate;
@property (retain)CLPlacemark* placemark ;
@end
