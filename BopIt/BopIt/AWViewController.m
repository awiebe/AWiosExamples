//
//  AWViewController.m
//  BopIt
//
//  Created by Abram Wiebe on 2013-03-11.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import "AWViewController.h"

@interface AWViewController ()

@end

@implementation AWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    model = [AWBopitModel new];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startGame
{
    if(gameTimer != Nil)
    {
        [gameTimer invalidate];
    }
    success = NO;
    gameOn = YES;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:model.delayTime
                                     target:self
                                    selector:@selector(nextRound)
                                   userInfo:Nil
                                    repeats:YES];
    self.instruction.text= model.instructionString;
}
-(void)nextRound
{
    if (gameOn == NO)
    {
        return;
    }
    if (success == NO)
    {
        
        [self gameOver];
        return;
    }
    success = NO;
    [model nextRound];
    [self showGood];
    [gameTimer setFireDate:[ NSDate dateWithTimeIntervalSinceNow:model.delayTime]];
    self.instruction.text= model.instructionString;
}

-(void)gameOver
{
    self.instruction.text = [NSString stringWithFormat:@"Game Over\n Score:%d",model.level ];
    _startButton.hidden = NO;
    [model reset];
    [gameTimer invalidate];
    gameTimer = nil;
    gameOn = NO;
    
    return;
    
}

- (IBAction)startButtonClicked:(id)sender
{
    [_startButton setHidden:YES];
    [self startGame];
}

- (IBAction)tapRecognizer:(UITapGestureRecognizer *)recognizer
{
    success = (model.value == tap);
    if(success)
    {
        [self nextRound];
    }
}
- (IBAction)swipeRecognizer:(UISwipeGestureRecognizer *)recognizer
{
    success = (model.value == swipe);
    if(success)
    {
        [self nextRound];
    }
}
- (IBAction)pinchRecognizer:(UIPinchGestureRecognizer *)recognizer
{
   success = (model.value == pinch);
    if(success)
    {
        [self nextRound];
    }
}
- (IBAction)rotationRecognizer:(UIRotationGestureRecognizer *)recognizer
{
    success = (model.value == twist);
    if(success)
    {
        [self nextRound];
    }
}
- (IBAction)holdRecognizer:(UILongPressGestureRecognizer *)recognizer
{
    success = (model.value == hold);
    if(success)
    {
        [self nextRound];
    }
}

-(void)showGood
{
    _goodBox.hidden = NO;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(hideGood) userInfo:nil repeats:NO];
}

-(void)hideGood
{
    _goodBox.hidden = YES;
}


- (void)dealloc
{
    [model release];
    [_instruction release];
    [gameTimer invalidate];
    [gameTimer release];
    [_startButton release];
    [_goodBox release];
    [super dealloc];
}
@end
