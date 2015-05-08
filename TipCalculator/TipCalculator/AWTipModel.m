//
//  AWTipModel.m
//  TipCalculator
//
//  Created by Abram Wiebe on 2013-02-24.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import "AWTipModel.h"

@implementation AWTipModel

@synthesize billTotal;

-(id)init
{
    NSString* percentagePath = [[NSBundle mainBundle] pathForResource:@"percentages" ofType:@"plist"];
    self->tipPercentages = [[NSArray arrayWithContentsOfFile:percentagePath]retain];
    return self;
}

-(double)lowTipPercent
{
    NSNumber* val = [tipPercentages objectAtIndex:0];
    return val.doubleValue/100;
}
-(double)medTipPercent
{
    NSNumber* val = [tipPercentages objectAtIndex:1];
    return val.doubleValue/100;
}
-(double)highTipPercent
{
    NSNumber* val = [tipPercentages objectAtIndex:2];
    return val.doubleValue/100;
}

-(double)computeHigh
{
    return self.highTipPercent*billTotal.doubleValue;
}
-(double)computeMed
{
    return self.medTipPercent*billTotal.doubleValue;
}
-(double)computeLow
{
    return self.lowTipPercent*billTotal.doubleValue;
}
-(NSString*)lowTipString
{
    NSNumber* val = [self->tipPercentages objectAtIndex:0];
    return [NSString stringWithFormat:@"%@%%",val];
}
-(NSString*)medTipString
{
    NSNumber* val = [self->tipPercentages objectAtIndex:1];
    return [NSString stringWithFormat:@"%@%%",val];
}
-(NSString*)highTipString
{
    NSNumber* val = [self->tipPercentages objectAtIndex:2];
    return [NSString stringWithFormat:@"%@%%",val];
}
@end
