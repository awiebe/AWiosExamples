//
//  AWBucketList.h
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-04-04.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBucketListEntry.h"
@interface AWBucketList : NSObject
{
    @private
    NSMutableArray* state;
    NSString* plistPath;
}
-(void) encodeRestorableState;
-(void) decodeRestorableState;
-(AWBucketListEntry*)getEntryWithIndex:(NSUInteger)i;
-(void)removeEntryWithIndex:(NSUInteger)i;
-(void)addEntryWithName:(NSString*)name;
-(NSUInteger)count;
-(void)setEntryWithIndex:(NSUInteger)i to:(AWBucketListEntry*)e;

@end
