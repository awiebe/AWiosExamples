//
//  AWViewController.m
//  BinaryConverter
//
//  Created by Abram Wiebe on 2013-01-21.
//  Copyright (c) 2013 Abram Wiebe. All rights reserved.
//

#import "AWViewController.h"
const int DISPLAY_BIT_COUNT = 64;
@interface AWViewController ()

@end

@implementation AWViewController
@synthesize output;
@synthesize outputString;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    outputString = [[NSMutableString new]retain];
    [self clearDisplay];
    
}

- (void)viewDidUnload
{
    //cleanup
    [outputString release];
    [super viewDidUnload];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)button0Pressed:(id)sender
{
    if (displayDirty)
    {
        [self clearDisplay];
    }

    if ([outputString length] < DISPLAY_BIT_COUNT)
    {
        [outputString appendString:@"0"];
        [self updateDisplay];
    }
}

-(IBAction)button1Pressed:(id)sender
{
    if (displayDirty)
    {
        [self clearDisplay];
    }

    if ([outputString length] < DISPLAY_BIT_COUNT)
    {
        [outputString appendString:@"1"];
        [self updateDisplay];
    }
}

-(IBAction)convertButton:(id)sender
{
    if (displayDirty == NO)
    {
        unsigned long long converted =0;
        
        //1 to acount for null terminator
        char* binary = malloc([outputString length]+1);
        [outputString getCString:binary maxLength:outputString.length+1 encoding:NSASCIIStringEncoding];
        
        //1 for null terminator one for zero index
        for (int i =0; i < [outputString length] ; i++)
        {
            converted=converted<<1;
            char c = binary[i];
            if( c =='1')
            {
                converted++;
            }
            
        }
        //NSLog(@"%@",[NSNumber numberWithUnsignedLongLong:converted]);
        // NSNumber* outNumber =[NSNumber numberWithUnsignedLongLong:converted];
        [outputString release];
        // outputString = [[NSMutableString stringWithString:[outNumber stringValue] ] retain];
        outputString = [[NSMutableString stringWithFormat:@"%llu",converted ] retain];
        [self updateDisplay];
        displayDirty = YES;
    }
          
}

-(IBAction)clearButton:(id)sender
{
    [self clearDisplay];
}


-(IBAction)backspaceButton:(id)sender
{
    if (displayDirty)
    {
        return;
    }
    
    if (outputString.length >0)
    {
        NSRange cursor = {outputString.length -1,1};
        [outputString deleteCharactersInRange:cursor];
    }
    [self updateDisplay];
}


////Private///

-(void)clearDisplay
{
    outputString = [@"" mutableCopy];
    [self updateDisplay];
    displayDirty = NO;
}

-(void)updateDisplay
{
    //NSLog(@"%@",outputString);
    output.text = outputString;
}

@end
