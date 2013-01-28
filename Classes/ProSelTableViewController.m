//
//  ProSelTableViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 10-08-03.
//  Copyright 2010 DeVry Healthcare Group Center for Excellence in Simulation. All rights reserved.
//

#import "ProSelTableViewController.h"
#import "IntroTableViewController.h"
#import "NormalTableViewController.h"
#import "InMurTableViewController.h"
#import "AorValSclTableViewController.h"
#import "HypTenTableViewController.h"
#import "AngPecTableViewController.h"
#import "AIMITableViewController.h"


static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";

@implementation ProSelTableViewController
@synthesize menuListProSel;

- (void)viewDidLoad
{	
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	self.title = @"Select Program";
	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuListProSel = [NSMutableArray array];
	
	// 44 - Intro Program: **************************** //
	IntroTableViewController *introTableViewController = [[IntroTableViewController alloc]
														  initWithNibName:@"IntroTableViewController" bundle:nil];
	[introTableViewController setTitle:@"44 - Intro"];
	[self.menuListProSel  addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"44 - Intro", @""), kTitleKey,
							  introTableViewController, kViewControllerKey,
							  nil]];
	
	[TestFlight passCheckpoint:@"Select 44"];
    
    [introTableViewController release];
	
	// 46 - Normal Program: ***************************** // 
	
	NormalTableViewController *normalTableViewController = [[NormalTableViewController alloc]
															initWithNibName:@"NormalTableViewController" bundle:nil];
	[normalTableViewController setTitle:@"46 - Normal"];
	[self.menuListProSel  addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"46 - Normal", @""), kTitleKey,
							  normalTableViewController, kViewControllerKey,
							  nil]];
	
	[TestFlight passCheckpoint:@"Select 46"];
    
    [normalTableViewController release];
	
	// 22 - Innocent Murmer: ***************************** // 
	
	InMurTableViewController *inMurTableViewController = [[InMurTableViewController alloc]
														  initWithNibName:@"InMurTableViewController" bundle:nil];
	[inMurTableViewController setTitle:@"22 - Innocent Murmur"];
	[self.menuListProSel  addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"22 - Innocent Murmur", @""), kTitleKey,
							  inMurTableViewController, kViewControllerKey,
							  nil]];
	
	[TestFlight passCheckpoint:@"Select 22"];
    
    [inMurTableViewController release];
	
    /*
	// 49 - Aortic Valve Sclerosis: ***************************** // 
	
	AorValSclTableViewController *aorValSclTableViewController = [[AorValSclTableViewController alloc]
																  initWithNibName:@"AorValSclTableViewController" bundle:nil];
	[aorValSclTableViewController setTitle:@"49 - Aortic Valve Sclerosis"];
	[self.menuListProSel addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"49 - Aortic Valve Sclerosis", @""), kTitleKey,
							  aorValSclTableViewController, kViewControllerKey,
							  nil]];
	
	[aorValSclTableViewController release];
	*/
	
	
    // 36 - Hypertension: ***************************** // 
	
	HypTenTableViewController *hypTenTableViewController = [[HypTenTableViewController alloc]
															initWithNibName:@"HypTenTableViewController" bundle:nil];
	[hypTenTableViewController setTitle:@"36 - Hypertension"];
	[self.menuListProSel addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"36 - Hypertension", @""), kTitleKey,
							  hypTenTableViewController, kViewControllerKey,
							  nil]];
	
	[TestFlight passCheckpoint:@"Select 36"];
    
    [hypTenTableViewController release];
	
	
	// 39 - Angina Pectoris: ***************************** // 
	
	
	AngPecTableViewController *angPecTableViewController = [[AngPecTableViewController alloc]
															initWithNibName:@"AngPecTableViewController" bundle:nil];
	[angPecTableViewController setTitle:@"39 - Angina Pectoris"];
	[self.menuListProSel addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"39 - Angina Pectoris", @""), kTitleKey,
							  angPecTableViewController, kViewControllerKey,
							  nil]];
	
    [TestFlight passCheckpoint:@"Select 39"];
    
	[angPecTableViewController release];
	
	/*
	// 43 - Acute Inferior Myocardial Infarction: ***************************** // 
	
	
	AIMITableViewController *aimiTableViewController = [[AIMITableViewController alloc]
														initWithNibName:@"AIMITableViewController" bundle:nil];
	[aimiTableViewController setTitle:@"43 - Acute Inferior M.I."];
	[self.menuListProSel addObject:[NSDictionary dictionaryWithObjectsAndKeys:
							  NSLocalizedString(@"43 - Acute Inferior M.I.", @""), kTitleKey,
							  aimiTableViewController, kViewControllerKey,
							  nil]];
	
	[aimiTableViewController release];
	
     */
     // *********************************************************************** //

	
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
	
	self.menuListProSel = nil;
}

- (void)dealloc
{
	[menuListProSel release];	
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
	UIViewController *targetViewController = [[self.menuListProSel objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark -
#pragma mark UITableViewDataSource

// tell our table how many rows it will have, in our case the size of our menuList
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuListProSel count];
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
	
	cell.textLabel.text = [[self.menuListProSel objectAtIndex:indexPath.row] objectForKey:kTitleKey];
	
	return cell;
}




@end