//
//  AWBucketListEntry.m
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-04-07.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import "AWBucketListEntry.h"

@implementation AWBucketListEntry


-(AWBucketListEntry*)entryWithName:(NSString*)name
{
    AWBucketListEntry* e = [[AWBucketListEntry new] autorelease];
    e.name = name;
    return e;
}
@end
