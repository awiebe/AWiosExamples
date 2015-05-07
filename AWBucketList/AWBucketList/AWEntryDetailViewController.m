//
//  AWEntryDetailViewController.m
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-04-04.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import "AWEntryDetailViewController.h"

@implementation AWEntryDetailViewController
@synthesize scrollView;
@synthesize activeField;
-(void)awakeFromNib
{
    [super awakeFromNib];
    //  [self.notesBox addSubview:_inputAccessorybar];
    // [self registerForKeyboardNotifications];
    // [self init];
}

-(id)init{
    [super init];
    locationManager = [AWLocationManager new];
    return self;
}


- (IBAction)removeCompletionDate:(UIButton*)sender
{
    sender.hidden=YES;
    entry.date = nil;
    self.completionDateField.text = @"";
}

-(void)editEntry:(AWBucketListEntry*)e atIndex:(NSUInteger)i
{
    self->editingIndex = i;
    [e retain];
    self->entry=e;
    self.titleField.text= e.name;
    self.locationField.text = e.location;
    self.notesBox.text = e.details;
    [self.evidenceButton setImage:e.image forState:UIControlStateNormal];
    self.completionDateField.text = e.date.description;
}


- (IBAction)evidencebuttonClicked:(UIButton *)sender
{
    [self startMediaBrowserFromViewController: self
     
                                usingDelegate: self];
}

- (IBAction)getLocationButtonPressed:(id)sender
{
    locationManager.placemark = nil;
    [_retrieveLocationIndicator startAnimating];
    [locationManager startUpdatingCurrentLocation];
    _locationField.text = [locationManager currentLocation];
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateLocation:) userInfo:nil repeats:YES];
}

- (void)updateLocation:(NSTimer*)theTimer
{
    if([locationManager ready] == NO)
    {
        return;
    }
    _locationField.text = [locationManager currentLocation];
    [theTimer invalidate];

    [locationManager stopUpdatingCurrentLocation];
    [_retrieveLocationIndicator stopAnimating];
}




- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller

                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               
                                               UINavigationControllerDelegate>) delegate {
    
    
    
    if (([UIImagePickerController isSourceTypeAvailable:
          
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        
        || (delegate == nil)
        
        || (controller == nil))
        
        return NO;
    
    
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    
    
    // Displays saved pictures and movies, if both are available, from the
    
    // Camera Roll album.
    
    mediaUI.mediaTypes =
    
    [UIImagePickerController availableMediaTypesForSourceType:
     
     UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    
    
    // Hides the controls for moving & scaling pictures, or for
    
    // trimming movies. To instead show the controls, use YES.
    
    mediaUI.allowsEditing = NO;
    
    
    
    mediaUI.delegate = delegate;
    
    
    
    [controller presentModalViewController: mediaUI animated: YES];
    
    return YES;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.inputAccessoryView = self.inputAccessorybar;
    if(textField.tag ==1)
    {
        textField.inputView = self.datePicker;
        if(self->entry.date != nil)
        self.datePicker.date = self->entry.date;
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField

{
    
    activeField = textField;
    
}



- (void)textFieldDidEndEditing:(UITextField *)textField

{
    if(textField.tag ==1)
    {
        textField.text = self.datePicker.date.description;
        self.dateRemoveButton.hidden = NO;
    }
    activeField = nil;
    
}

-(BOOL)textViewShouldBeginEditing:(UITextView*)textView
{
  textView.inputAccessoryView = self.inputAccessorybar;
    
    return YES;
}
-(void)textViewDidBeginEditing:(UITextView*)textView
{
    activeField = (UIControl*)textView;
}
-(void)textViewdidEndEditing:(UITextView*)textView
{
    activeField = nil;
}

/* //Keyboard scroll andeling not implemented not needed for current implementation.
// Call this method somewhere in your view controller setup code.

- (void)registerForKeyboardNotifications

{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
    
}



// Called when the UIKeyboardDidShowNotification is sent.

- (void)keyboardWasShown:(NSNotification*)aNotification

{
    
    NSDictionary* info = [aNotification userInfo];
    
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    scrollView.contentInset = contentInsets;
    
    scrollView.scrollIndicatorInsets = contentInsets;
    
    
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    
    // Your application might not need or want this behavior.
    
    CGRect aRect = self.view.frame;
    
    aRect.size.height -= kbSize.height;
    
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-kbSize.height);
        
        [scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
}



// Called when the UIKeyboardWillHideNotification is sent

- (void)keyboardWillBeHidden:(NSNotification*)aNotification

{
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    
    scrollView.contentInset = contentInsets;
    
    scrollView.scrollIndicatorInsets = contentInsets;
    
}
 */

- (IBAction)detailViewDoneButtonPushed:(id)sender {
    [self commitEntry];
    [UIView transitionFromView:self.view toView:self.superViewController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
    [self.superViewController updateContent];
}

-(void)commitEntry
{
    AWBucketListEntry* e = self->entry;
    e.name = self.titleField.text;
    e.location = self.locationField.text;
    e.details = self.notesBox.text;
    e.image = self->evidenceImage;
    e.date = self.datePicker.date;
    [self.model setEntryWithIndex:self->editingIndex to:e];
    [e release];
}

- (IBAction)keyboardDoneButtonPressed:(UIBarButtonItem *)sender
{
    [self.view endEditing:YES];
}



#pragma mark handleEvidence

- (void) imagePickerController: (UIImagePickerController *) picker

 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    
    UIImage *originalImage, *editedImage, *imageToUse;
    
    
    
    // Handle a still image picked from a photo album
    
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        
        == kCFCompareEqualTo) {
        
        
        
        editedImage = (UIImage *) [info objectForKey:
                                   
                                   UIImagePickerControllerEditedImage];
        
        originalImage = (UIImage *) [info objectForKey:
                                     
                                     UIImagePickerControllerOriginalImage];
        
        
        
        if (editedImage) {
            
            imageToUse = editedImage;
            
        } else {
            
            imageToUse = originalImage;
            
        }
        
[self.evidenceButton setImage:imageToUse forState:UIControlStateNormal];
        self->evidenceImage = imageToUse;

    }
    
    
    
    
[picker dismissViewControllerAnimated:YES completion:nil];

    [picker release];
    
}

-(void)dealloc
{
    [_model release];
    [_titleField release];
    [_locationField release];
    [_notesBox release];
    [_retrieveLocationIndicator release];
    [_inputAccessorybar release];
    [_evidenceButton release];
    [locationManager release];
    [_completionDateField release];
    [_datePicker release];
    [_dateRemoveButton release];
    [super dealloc];
}

@end

