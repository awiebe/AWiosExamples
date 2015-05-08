//
//  AWBopitModel.h
//  BopIt
//
//  Created by Abram Wiebe on 2013-03-13.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import <Foundation/Foundation.h>

enum AWBopitValue {
    tap = 0,
    twist = 1,
    pinch = 2,
    swipe = 3,
    hold = 4
    };
@interface AWBopitModel : NSObject
{
    @private
    NSArray* options;
    NSUInteger currentIndex;
}
@property double delayTime;
@property enum AWBopitValue value;
@property NSUInteger level;

-(NSString*)instructionString;
-(void)nextRound;
-(void)reset;


@end
