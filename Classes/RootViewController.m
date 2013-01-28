//
//  RootViewController.m
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//


#import "RootViewController.h"
#import "ProSelTableViewController.h"
#import "QuizViewController.h"
#import "AboutViewController.h"
#import "TestFlight.h"
/*
 
#import "IntroTableViewController.h"
#import "NormalTableViewController.h"
#import "InMurTableViewController.h"
#import "AorValSclTableViewController.h"
#import "HypTenTableViewController.h"
#import "AngPecTableViewController.h"
#import "AIMITableViewController.h"
*/

static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";


@implementation RootViewController
@synthesize menuList;

- (void)viewDidLoad
{	
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	self.title = @"iHarvey";
    
[AppboySession sessionWithApiKey:@"82179cc5-970f-44ca-a1db-b7b28e41b22a" usingDelegate:self];
   
    
 	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuList = [NSMutableArray array];
	

	 
	
	// Select Program: **************************** //
	ProSelTableViewController *prosel = [[ProSelTableViewController alloc]
														  initWithNibName:@"ProSelTableViewController" bundle:nil];
	[prosel setTitle:@"Select Patient Program"];
	[self.menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"Select Patient Program", @""), kTitleKey,
							  prosel, kViewControllerKey,
							  nil]];
	
	
    [TestFlight passCheckpoint:@"Program Select"];
    [prosel release];


	// Quiz Mode: ***************************** // 
	
	QuizViewController *quiz = [[QuizViewController alloc]
															initWithNibName:@"QuizViewController" bundle:nil];
	[quiz setTitle:@"Diagnosis Patient"];
	[self.menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"Diagnosis Patient", @""), kTitleKey,
							  quiz, kViewControllerKey,
							  nil]];
	
	
    
    [TestFlight passCheckpoint:@"Quiz Mode"];
    [quiz release];
	
	
	// About: ***************************** // 
	
	AboutViewController *about = [[AboutViewController alloc]
														  initWithNibName:@"AboutViewController" bundle:nil];
	[about setTitle:@"About"];
	[self.menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"About", @""), kTitleKey,
							  about, kViewControllerKey,
							  nil]];
	
    
    [TestFlight passCheckpoint:@"About"];
    [about release];
	
		
	// create a custom navigation bar button and set it to always say "Back"
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	
	[temporaryBarButtonItem release];


}



// called after the view controller's view is released and set to nil.
// For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
// So release any properties that are loaded in viewDidLoad or can be recreated lazily.
//
- (void)viewDidUnload
{
	[super viewDidUnload];
	
	self.menuList = nil;
}

- (void)dealloc
{
	[menuList release];	
	[super dealloc];
}


#pragma mark -
#pragma mark UIViewController delegate

- (void)viewWillAppear:(BOOL)animated
{
	// this UIViewController is about to re-appear, make sure we remove the current selection in our table view
	NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}




#pragma mark -
#pragma mark UITableViewDelegate

// the table's selection has changed, switch to that item's UIViewController
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIViewController *targetViewController = [[self.menuList objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark -
#pragma mark UITableViewDataSource

// tell our table how many rows it will have, in our case the size of our menuList
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuList count];
}

// tell our table what kind of cell to use and its title for the given row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	cell.textLabel.text = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kTitleKey];
	
	return cell;
}




@end
