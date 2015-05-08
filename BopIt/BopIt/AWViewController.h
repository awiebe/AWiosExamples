//
//  AWViewController.h
//  BopIt
//
//  Created by Abram Wiebe on 2013-03-11.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWBopitModel.h"

@interface AWViewController : UIViewController <UIGestureRecognizerDelegate>
{
    @private
    NSArray* a;
    NSTimer* gameTimer;
    AWBopitModel* model;
    BOOL success;
    BOOL gameOn;
    
}
@property (retain, nonatomic) IBOutlet UILabel *instruction;
@property (retain, nonatomic) IBOutlet UIButton *startButton;
@property (retain, nonatomic) IBOutlet UIView *goodBox;

-(void)nextRound;
- (IBAction)startButtonClicked:(id)sender;

@end
