//
//  AWAppDelegate.h
//  TipCalculator
//
//  Created by Abram Wiebe on 2013-02-24.
//  Copyright (c) 2013 BurningThumb Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AWViewController;

@interface AWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AWViewController *viewController;

@end
