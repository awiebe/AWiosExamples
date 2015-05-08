//
//  AWViewController.h
//  BinaryConverter
//
//  Created by Abram Wiebe on 2013-01-21.
//  Copyright (c) 2013 Abram Wiebe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AWViewController : UIViewController
{
    @private
    UILabel* output;
    NSMutableString* outputString;
    BOOL displayDirty;
    
}

@property(retain) IBOutlet UILabel* output;
@property(retain) NSMutableString* outputString;

-(IBAction)button0Pressed:(id)sender;
-(IBAction)button1Pressed:(id)sender;
-(IBAction)convertButton:(id)sender;
-(IBAction)clearButton:(id)sender;
-(IBAction)backspaceButton:(id)sender;
@end

