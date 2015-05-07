//
//  AWAppDelegate.h
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-03-28.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AWViewController;

@interface AWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AWViewController *viewController;

@end
