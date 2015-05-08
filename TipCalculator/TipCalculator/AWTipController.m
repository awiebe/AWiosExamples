//
//  AWTipController.m
//  TipCalculator
//
//  Created by Abram Wiebe on 2013-02-24.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import "AWTipController.h"

@implementation AWTipController
{
    @private
    NSNumberFormatter* formatter;
}

@synthesize billTotal;
@synthesize lowTipLabel;
@synthesize medTipLabel;
@synthesize highTipLabel;

@synthesize lowTip;
@synthesize medTip;
@synthesize highTip;

@synthesize lowTotal;
@synthesize medTotal;
@synthesize highTotal;

@synthesize customSlider;
@synthesize customTip;
@synthesize customTotal;

-(void)awakeFromNib
{
    lowTipLabel.text = [model lowTipString];
    medTipLabel.text = [model medTipString];
    highTipLabel.text = [model highTipString];
    [billTotal becomeFirstResponder];
    
    [self init];
}
-(id)init
{
    formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];

    model = [[AWTipModel alloc] init];
    return self;
}
-(void)dealloc
{
    [model release];
    [super dealloc];
}

-(IBAction)tipSliderDidChange:(id)sender
{
    customTip.text = [NSString stringWithFormat:@"%@",model.customPercentage.stringValue];
    NSLog(@"tipSliderDidchangeto:%f",customSlider.value);
    return;
}
-(IBAction)billTotalDidChange:(id)sender
{
    int i = (int)(model.billTotal.doubleValue * 1000);
    int mod = i%10;
    
    if (mod != 0)
    {
        billTotal.text = [NSString stringWithFormat:@"%.2f",(double)((int)i)/100];
    }
    
    model.billTotal = [NSNumber numberWithDouble:billTotal.text.doubleValue ];
    [self computeAll];;

}
    


-(IBAction)customPercentageDidChange:(id)sender
{
    [self computeCustom];
}

-(void)computeAll
{
    [self computePreset];
    [self computeCustom];
}
-(void)computePreset
{
    double lhighTip = [model computeHigh];
    double lmedTip  = [model computeMed];
    double llowTip  = [model computeLow];
    double lbillTotal = [[model billTotal]doubleValue];
    
    NSString* currency = [[NSLocale currentLocale] objectForKey:NSLocaleCurrencySymbol];
    lowTip.text = [NSString stringWithFormat:@"%.2f%@",llowTip,currency];
    medTip.text = [NSString stringWithFormat:@"%.2f%@",lmedTip,currency];
    highTip.text = [NSString stringWithFormat:@"%.2f%@",lhighTip,currency];
    
    lowTotal.text = [NSString stringWithFormat:@"%.2f%@",llowTip+lbillTotal,currency];
    medTotal.text = [NSString stringWithFormat:@"%.2f%@",lmedTip+lbillTotal,currency];
    highTotal.text = [NSString stringWithFormat:@"%.2f%@",lhighTip+lbillTotal,currency];
}
-(void)computeCustom
{
    
}


@end
