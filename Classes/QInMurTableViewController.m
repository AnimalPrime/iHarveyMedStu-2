//
//  QInMurTableViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 10-08-04.
//  Copyright 2010 DeVry Healthcare Group Center for Excellence in Simulation. All rights reserved.
//

#import "QInMurTableViewController.h"
#import "InMurTableViewController.h"
#import "IntroLungSoundsViewController.h"
#import "InMurHeartSoundsViewContoller.h"
#import "InMurAppearenceViewController.h"
#import "InMurJVPViewController.h"
#import "InMurAPViewController.h"
#import "InMurPreCorViewController.h"
#import "QInMurFinalViewController.h"

static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";


@implementation QInMurTableViewController
@synthesize menuListInMur;

- (void)viewDidLoad
{	
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuListInMur = [NSMutableArray array];
	
	// Appearance: **************************** //
	InMurAppearenceViewController *inMurAppearenceViewController = [[InMurAppearenceViewController alloc]
																	initWithNibName:@"InMurAppearenceViewController" bundle:nil];
	[inMurAppearenceViewController setTitle:@"Appearance"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Appearance", @""), kTitleKey,
								   inMurAppearenceViewController, kViewControllerKey,
								   nil]];
	
	[inMurAppearenceViewController release];
	
	// J.V.P. : **************************** //
	InMurJVPViewController *inMurJVPViewController = [[InMurJVPViewController alloc]
													  initWithNibName:@"InMurJVPViewController" bundle:nil];
	[inMurJVPViewController setTitle:@"Jugular Venous Pulse"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Jugular Venous Pulse", @""), kTitleKey,
								   inMurJVPViewController, kViewControllerKey,
								   nil]];
	
	[inMurJVPViewController release];
	
	
	//Arterial Pulse : **************************** //
	InMurAPViewController *inMurAPViewController = [[InMurAPViewController alloc]
													initWithNibName:@"InMurAPViewController" bundle:nil];
	[inMurAPViewController setTitle:@"Arterial Pulse"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Arterial Pulse", @""), kTitleKey,
								   inMurAPViewController, kViewControllerKey,
								   nil]];
	
	[inMurAPViewController release];
	
	
	// Precordial Movements : **************************** //
	InMurPreCorViewController *inMurPreCorViewController = [[InMurPreCorViewController alloc]
															initWithNibName:@"InMurPreCorViewController" bundle:nil];
	[inMurPreCorViewController setTitle:@"Precordial Movements"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Precordial Movements", @""), kTitleKey,
								   inMurPreCorViewController, kViewControllerKey,
								   nil]];
	
	[inMurPreCorViewController release];
	
	
	// Cardiac Auscultation: ***************************** // 
	
	InMurHeartSoundsViewContoller *inMurHeartSoundsViewController = [[InMurHeartSoundsViewContoller alloc]
																	 initWithNibName:@"InMurHeartSoundsViewContoller" bundle:nil];
	[inMurHeartSoundsViewController setTitle:@"Cardiac Auscultation"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Cardiac Auscultation", @""), kTitleKey,
								   inMurHeartSoundsViewController, kViewControllerKey,
								   nil]];
	
	[inMurHeartSoundsViewController release];
	
	
	// Pulmonary Auscultation: ***************************** // 
	
	IntroLungSoundsViewController *introLungSoundsViewController = [[IntroLungSoundsViewController alloc]
																	initWithNibName:@"IntroLungSoundsViewController" bundle:nil];
	[introLungSoundsViewController setTitle:@"Pulmonary Auscultation"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Pulmonary Auscultation", @""), kTitleKey,
								   introLungSoundsViewController, kViewControllerKey,
								   nil]];
	
	[introLungSoundsViewController release];
	
	
	
	// Final Diagnosis: ***************************** // 
	
	QInMurFinalViewController *inMurFinalViewController = [[QInMurFinalViewController alloc]
														  initWithNibName:@"QInMurFinalViewController" bundle:nil];
	[inMurFinalViewController setTitle:@"Final Diagnosis"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Final Diagnosis", @""), kTitleKey,
								   inMurFinalViewController, kViewControllerKey,
								   nil]];
	
	
	
	
	
	[inMurFinalViewController release];
	
	
	
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
	
	self.menuListInMur = nil;
}

- (void)dealloc
{
	[menuListInMur release];	
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
	UIViewController *targetViewController = [[self.menuListInMur objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark -
#pragma mark UITableViewDataSource

// tell our table how many rows it will have, in our case the size of our menuListIntro
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuListInMur count];
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
	
	cell.textLabel.text = [[self.menuListInMur objectAtIndex:indexPath.row] objectForKey:kTitleKey];
	
	return cell;
}




@end