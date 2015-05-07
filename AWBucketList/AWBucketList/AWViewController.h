//
//  AWViewController.h
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-03-28.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWBucketList.h"
#import "AWLocationManager.h"
#import "AWEntryDetailViewController.h"
@interface AWViewController : UIViewController <UITableViewDelegate>
{
@private
    UITableViewCell *cell;

    UITextField *entryNameField;
        
}

@property (retain) IBOutlet UINavigationItem* navigationItem;
@property (retain) AWBucketList* model;
@property (retain, nonatomic) IBOutlet UITableView *table;
@property (retain) IBOutlet AWEntryDetailViewController* detailViewController;
@property (retain) IBOutlet UIBarButtonItem* editButton;
@property (retain) AWLocationManager* locationManager;
- (IBAction)editTable:(UIButton *)sender;
- (IBAction)addEntryButton:(UIBarButtonItem *)sender;
-(void)updateContent;


@end
