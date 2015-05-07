//
//  AWBucketListEntry.h
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-04-07.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AWBucketListEntry : NSObject

@property (retain) NSString* name;
@property (retain) NSString* location;
@property (retain) NSString* details;
@property (retain) UIImage* image;
@property (retain) NSDate* date;

-(AWBucketListEntry*)entryWithName:(NSString*)name;
@end
