//
//  AWLocationManager.m
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-03-28.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import "AWLocationManager.h"

@implementation AWLocationManager
- (void)startUpdatingCurrentLocation
{
    // if location services are restricted do nothing
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied ||
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted )
    {
        return;
    }
    
    // if locationManager does not currently exist, create it
    if (!_locationManager)
    {
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager setDelegate:self];
        _locationManager.distanceFilter = 10.0f; // we don't need to be any more accurate than 10m
                                                 //        _locationManager.purpose = @"This may be used to obtain your reverse geocoded address";
    }
    
    [_locationManager startUpdatingLocation];
    
    //    [self showCurrentLocationSpinner:YES];
}

- (void)stopUpdatingCurrentLocation
{
    [_locationManager stopUpdatingLocation];
    
    //[self showCurrentLocationSpinner:NO];
}

-(void)dealloc
{
    [self stopUpdatingCurrentLocation];
    [_locationManager release];
    [super dealloc];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // if the location is older than 30s ignore
    if (fabs([newLocation.timestamp timeIntervalSinceDate:[NSDate date]]) > 30)
    {
        return;
    }
    
   NSLog(@"LONG:%fLAT:%f",newLocation.coordinate.longitude,newLocation.coordinate.latitude);
    CLGeocoder *geocoder = [[[CLGeocoder alloc] init] autorelease];
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
        if (error){
            NSLog(@"Geocode failed with error: %@", error);
            //[self displayError:error];
            return;
        }
        self.placemark = [placemarks objectAtIndex:0];
        NSLog(@"Received placemarks: %@,%@", _placemark.locality,_placemark.country );
        //[self displayPlacemarks:placemarks];
    }];

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    
    // stop updating
    [self stopUpdatingCurrentLocation];
    
    // since we got an error, set selected location to invalid location
    _currentUserCoordinate = kCLLocationCoordinate2DInvalid;
    
    // show the error alert
    UIAlertView *alert = [[[UIAlertView alloc] init] autorelease];
    alert.title = @"Error updating location";
    alert.message = [error localizedDescription];
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

-(NSString*)currentLocation
{
    if(![self ready])
    {
        return @"Searching";
    }
    return [NSString stringWithFormat:@"(%.1f,%.1f)\n %@,%@",
            _placemark.location.coordinate.longitude,
            _placemark.location.coordinate.latitude
            ,_placemark.locality,_placemark.country];
}

-(BOOL)ready
{
    return self.placemark != nil;
}

-(void)clear
{
    //reset placemark
}




@end
