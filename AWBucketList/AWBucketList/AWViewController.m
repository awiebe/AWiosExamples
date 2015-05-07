//
//  AWViewController.m
//  AWBucketList
//
//  Created by Abram Wiebe on 2013-03-28.
//  Copyright (c) 2013 Langara. All rights reserved.
//

#import "AWViewController.h"

@interface AWViewController ()

@end

@implementation AWViewController
@synthesize navigationItem;
@synthesize table;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationController=
    //self.locationManager = [AWLocationManager new];
    //   [self.locationManager startUpdatingCurrentLocation];
    entryNameField = [[UITextField alloc] initWithFrame:CGRectMake(16,83,252,25)];
    AWBucketList* model = [[AWBucketList new] autorelease];
    self.model = model;
    self.detailViewController.model = model;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) // Don't move the first row
        
        return NO;
    
    return YES;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView transitionFromView:self.view toView:_detailViewController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self.detailViewController editEntry: [self.model getEntryWithIndex:indexPath.row] atIndex:indexPath.row];
    [UIView transitionFromView:self.view toView:self.detailViewController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
}
-(NSUInteger)tableView:(UITableView*)t numberOfRowsInSection:(NSUInteger)section
{
    return [self.model count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
    }
    
    AWBucketListEntry* e =[self.model getEntryWithIndex:indexPath.row];
    cell.textLabel.text = e.name;
    // cell.editing=YES;
    //cell.detailTextLabel.text = [item objectForKey:@"secondaryTitleKey"];
    // cell.imageView.image = theImage;
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.model removeEntryWithIndex:indexPath.row];
    [table reloadData];
}

- (IBAction) editTable:(id)sender{
    
    if(self.editing)
    {
        [super setEditing:NO animated:NO];
        [table setEditing:NO animated:NO];
        [table reloadData];
        //self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editTable:)] autorelease];
        [self.navigationItem.backBarButtonItem setTitle:@"Edit"];
        [self.navigationItem.backBarButtonItem setStyle:UIBarButtonItemStylePlain];
    }
    else
    {
        [super setEditing:YES animated:YES];
        [table setEditing:YES animated:YES];
        [table reloadData];
        
        [self.navigationItem.backBarButtonItem setTitle:@"Done"];
        [self.navigationItem.backBarButtonItem setStyle:UIBarButtonItemStyleDone];
    }
}


- (void)dealloc {
    [table release];
    [super dealloc];
}
- (IBAction)addEntryButton:(UIBarButtonItem *)sender
{
    UIAlertView *newEntryAlert = [[UIAlertView alloc] initWithTitle:@"Create A new Entry"
                                                            message:@"What Should this entry be named?:\n\n\n"
                                                           delegate:self
                                                  cancelButtonTitle:NSLocalizedString(@"Cancel",nil)
                                                  otherButtonTitles:NSLocalizedString(@"OK",nil), nil];
    
    
    entryNameField.borderStyle = UITextBorderStyleRoundedRect;
    //passwordField.secureTextEntry = YES;
    entryNameField.keyboardAppearance = UIKeyboardAppearanceAlert;
    //entryNameField.delegate = self;
    [entryNameField becomeFirstResponder];
    [newEntryAlert addSubview:entryNameField];
    
    [newEntryAlert show];
    [newEntryAlert release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        
        [self.model addEntryWithName:entryNameField.text];
        //  [_detailViewController editEntryWithIndex:[model count]-1];
    }
    entryNameField.text=@"";
    [self.table reloadData];
}

-(void)updateContent
{
    [self.table reloadData];
}

@end
