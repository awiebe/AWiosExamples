//
//  AWAppDelegate.h
//  BucketList
//
//  Created by Abram Wiebe on 2013-03-28.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@end
