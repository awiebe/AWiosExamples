//
//  AWTipModel.h
//  TipCalculator
//
//  Created by Abram Wiebe on 2013-02-24.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kAWTipModel

@interface AWTipModel : NSObject
{
    @private
    NSArray* tipPercentages;
    
}
@property(retain)NSNumber* billTotal;
@property(retain)NSNumber* customPercentage;

-(double)lowTipPercent;
-(double)medTipPercent;
-(double)highTipPercent;

-(double)computeHigh;
-(double)computeMed;
-(double)computeLow;

-(NSString*)lowTipString;
-(NSString*)medTipString;
-(NSString*)highTipString;

@end
