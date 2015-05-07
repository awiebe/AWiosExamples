//
//  AWMasterViewController.h
//  BucketList
//
//  Created by Abram Wiebe on 2013-03-28.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AWDetailViewController;

@interface AWMasterViewController : UITableViewController

@property (strong, nonatomic) AWDetailViewController *detailViewController;

@end
