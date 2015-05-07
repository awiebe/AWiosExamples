//
//  AWBucketList.m
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-04-04.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import "AWBucketList.h"

#pragma mark constants
static NSString* const AWBucketListPersistatPlist = @"bucketList.plist";
#pragma mark implementation
@implementation AWBucketList

//{
//NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//NSString *documentsDirectory = [paths objectAtIndex:0];
//}
-(id)init
{
    [super init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    plistPath = [[documentsDirectory stringByAppendingPathComponent:AWBucketListPersistatPlist] retain];
    [self decodeRestorableState];
    //[paths release];
    return self;
}

-(void)decodeRestorableState
{
    NSLog(@"Decode restorable state");
    if([[NSFileManager defaultManager] isReadableFileAtPath:plistPath] == YES)
    {
        state = [[NSMutableArray arrayWithContentsOfFile:plistPath] retain];
    }
    if (state == nil)
    {
        NSLog(@"No previous state");
        state = [NSMutableArray new];
    }
}
-(void) encodeRestorableState
{
    NSLog(@"Encoding Bucket List");
    [state writeToFile:plistPath atomically:YES];
    
}

-(void)setEntryWithIndex:(NSUInteger)i to:(AWBucketListEntry *)e
{
    NSMutableDictionary* dictionary = [[NSMutableDictionary new] autorelease];
    
    if(e.name != nil)
    [dictionary setObject:e.name forKey:@"name"];
    
    if(e.details != nil)
    [dictionary setObject:e.details forKey:@"description"];
    
    if(e.image != nil)
        [dictionary setObject: UIImageJPEGRepresentation(e.image,1.0) forKey:@"image"];
    
    if(e.location != nil)
    [dictionary setObject:e.location forKey:@"location"];
    
    if(e.location != nil)
        [dictionary setObject:e.location forKey:@"location"];
    
    if(e.date != nil)
        [dictionary setObject:e.date forKey:@"date"];
    
    // NSLog(@"%d",[state count]);
    if( [state objectAtIndex:i] != nil)
    {
    [state replaceObjectAtIndex:i withObject:dictionary];
    }
    else
    {
        [state setObject:dictionary atIndexedSubscript:i];
    }
}

-(AWBucketListEntry*)getEntryWithIndex:(NSUInteger)i
{
    NSDictionary* d = [state objectAtIndex:i];
    AWBucketListEntry* e = [[AWBucketListEntry new] autorelease];
    e.name  = [d objectForKey:@"name"];
     e.location  = [d objectForKey:@"location"];
     e.details  = [d objectForKey:@"description"];
    e.image  = [UIImage imageWithData:[d objectForKey:@"image"]];
    e.date = [d objectForKey:@"date"];
    return e;
}

-(void)removeEntryWithIndex:(NSUInteger)i
{
    [state removeObjectAtIndex:i];
}

-(void)addEntryWithName:(NSString*)name
{
    NSMutableDictionary* dictionary = [[NSMutableDictionary new] autorelease];
    [dictionary setObject:name forKey:@"name"];
    [state addObject:dictionary];
     
    
}

-(NSUInteger)count
{
    return [state count];
}

-(void)dealloc
{
    [plistPath release];
    [state release];
    [super dealloc];
}
@end
