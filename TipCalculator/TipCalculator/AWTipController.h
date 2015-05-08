//
//  AWTipController.h
//  TipCalculator
//
//  Created by Abram Wiebe on 2013-02-24.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWTipModel.h"

@interface AWTipController : NSObject
{
    @private
    AWTipModel* model;
}
@property(retain) NSArray* tipPercentages;
@property(retain)IBOutlet UITextField* billTotal;

@property(retain)IBOutlet UILabel* lowTipLabel;
@property(retain)IBOutlet UILabel* medTipLabel;
@property(retain)IBOutlet UILabel* highTipLabel;

@property(retain)IBOutlet UITextField* lowTip;
@property(retain)IBOutlet UITextField* medTip;
@property(retain)IBOutlet UITextField* highTip;

@property(retain)IBOutlet UITextField* lowTotal;
@property(retain)IBOutlet UITextField* medTotal;
@property(retain)IBOutlet UITextField* highTotal;


@property(retain)IBOutlet UISlider* customSlider;
@property(retain)IBOutlet UITextField* customPercentage;

@property(retain)IBOutlet UITextField* customTip;
@property(retain)IBOutlet UITextField* customTotal;


-(IBAction)billTotalDidChange:(id)sender;
-(IBAction)tipSliderDidChange:(id)sender;
-(IBAction)customPercentageDidChange:(id)sender;




@end
