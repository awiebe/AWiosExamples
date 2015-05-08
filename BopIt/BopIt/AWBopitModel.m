//
//  AWBopitModel.m
//  BopIt
//
//  Created by Abram Wiebe on 2013-03-13.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import "AWBopitModel.h"

static const double defaultDelay = 3.0;
static const double minDelay = 0.5;

@implementation AWBopitModel

@synthesize delayTime;
@synthesize value;
@synthesize level;

- (id)init
{
    self = [super init];
    if (self)
    {
        srand(time(NULL));
        delayTime = 5.0;
        options = [NSArray arrayWithContentsOfFile:[ [NSBundle mainBundle] pathForResource:@"options" ofType:@"plist"] ];
        [options retain];
        level = 0;
    }
    return self;
}

-(void)nextRound
{
    NSUInteger previousndex = currentIndex;
    if (previousndex == currentIndex)
    {
            currentIndex = rand()%[options count];
    }
    value = currentIndex;
    level++;
    delayTime = fmax(defaultDelay - (double)level/25.0,minDelay);
}

-(NSString*)instructionString
{
    return [options objectAtIndex:currentIndex];
}
-(void)reset
{
    delayTime = defaultDelay;
    level = 0;
}

-(void)dealloc
{
    [options release];
    [super dealloc];
}

@end
