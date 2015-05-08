//
//  AWAppDelegate.h
//  BinaryConverter
//
//  Created by Abram Wiebe on 2013-01-21.
//  Copyright (c) 2013 Abram Wiebe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AWViewController;

@interface AWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AWViewController *viewController;

@end
