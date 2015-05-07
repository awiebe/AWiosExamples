//
//  AWEntryDetailViewController.h
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-04-04.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "AWBucketList.h"
#import "AWLocationManager.h"
@interface AWEntryDetailViewController : UIViewController <UITableViewDelegate,UITextFieldDelegate>
{
@private
    AWLocationManager* locationManager;
    //UIView* superView;
    UIImage* evidenceImage;
    AWBucketListEntry* entry;
    NSUInteger editingIndex;
}
@property (retain) IBOutlet UIViewController* superViewController;
@property (retain) IBOutlet UIScrollView* scrollView;
@property (retain) UIControl* activeField;
@property (retain) AWBucketList* model;
@property (retain, nonatomic) IBOutlet UITextField *titleField;
@property (retain, nonatomic) IBOutlet UITextField *locationField;
@property (retain, nonatomic) IBOutlet UITextView *notesBox;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *retrieveLocationIndicator;
@property (retain, nonatomic) IBOutlet UIToolbar *inputAccessorybar;
@property (retain, nonatomic) IBOutlet UIButton *evidenceButton;
@property (retain, nonatomic) IBOutlet UITextField *completionDateField;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (retain, nonatomic) IBOutlet UIButton *dateRemoveButton;
- (IBAction)removeCompletionDate:(id)sender;
-(void)editEntry:(AWBucketListEntry*)e atIndex:(NSUInteger)i;
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
-(BOOL)textViewShouldBeginEditing:(UITextView*)textView;
- (IBAction)evidencebuttonClicked:(UIButton *)sender;
- (IBAction)getLocationButtonPressed:(id)sender;


@end
