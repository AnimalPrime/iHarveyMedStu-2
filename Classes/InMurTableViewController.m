//
//  InMurTableViewController.m
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//


#import "InMurTableViewController.h"
#import "IntroLungSoundsViewController.h"
#import "InMurHeartSoundsViewContoller.h"
#import "InMurAppearenceViewController.h"
#import "InMurJVPViewController.h"
#import "InMurAPViewController.h"
#import "InMurPreCorViewController.h"
#import "InMurFinalViewController.h"

static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";

@implementation InMurTableViewController
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
	
	[TestFlight passCheckpoint:@"22-App"];
    
    [inMurAppearenceViewController release];
	
	// J.V.P. : **************************** //
	InMurJVPViewController *inMurJVPViewController = [[InMurJVPViewController alloc]
													  initWithNibName:@"InMurJVPViewController" bundle:nil];
	[inMurJVPViewController setTitle:@"Jugular Venous Pulse"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Jugular Venous Pulse", @""), kTitleKey,
								   inMurJVPViewController, kViewControllerKey,
								   nil]];
	
	[TestFlight passCheckpoint:@"22-JVP"];
    
    [inMurJVPViewController release];
	
	
	//Arterial Pulse : **************************** //
	InMurAPViewController *inMurAPViewController = [[InMurAPViewController alloc]
											initWithNibName:@"InMurAPViewController" bundle:nil];
	[inMurAPViewController setTitle:@"Arterial Pulse"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Arterial Pulse", @""), kTitleKey,
								   inMurAPViewController, kViewControllerKey,
								   nil]];

	[TestFlight passCheckpoint:@"22-ArtP"];
    
    [inMurAPViewController release];
		

	// Precordial Movements : **************************** //
	InMurPreCorViewController *inMurPreCorViewController = [[InMurPreCorViewController alloc]
															  initWithNibName:@"InMurPreCorViewController" bundle:nil];
	[inMurPreCorViewController setTitle:@"Precordial Movements"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Precordial Movements", @""), kTitleKey,
								   inMurPreCorViewController, kViewControllerKey,
								   nil]];
	
	[TestFlight passCheckpoint:@"22-PreCor"];
    
    [inMurPreCorViewController release];


	// Cardiac Auscultation: ***************************** // 
	
	InMurHeartSoundsViewContoller *inMurHeartSoundsViewController = [[InMurHeartSoundsViewContoller alloc]
																	  initWithNibName:@"InMurHeartSoundsViewContoller" bundle:nil];
	[inMurHeartSoundsViewController setTitle:@"Cardiac Auscultation"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Cardiac Auscultation", @""), kTitleKey,
								   inMurHeartSoundsViewController, kViewControllerKey,
								   nil]];
	
	[TestFlight passCheckpoint:@"22-HS"];
    
    [inMurHeartSoundsViewController release];
	
	
	// Pulmonary Auscultation: ***************************** // 
	
	IntroLungSoundsViewController *introLungSoundsViewController = [[IntroLungSoundsViewController alloc]
																	initWithNibName:@"IntroLungSoundsViewController" bundle:nil];
	[introLungSoundsViewController setTitle:@"Pulmonary Auscultation"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Pulmonary Auscultation", @""), kTitleKey,
								   introLungSoundsViewController, kViewControllerKey,
								   nil]];
	
	
    [TestFlight passCheckpoint:@"22-LS"];
    [introLungSoundsViewController release];
	
	
	
	// Final Diagnosis: ***************************** // 
	
	InMurFinalViewController *inMurFinalViewController = [[InMurFinalViewController alloc]
														  initWithNibName:@"InMurFinalViewController" bundle:nil];
	[inMurFinalViewController setTitle:@"Final Diagnosis"];
	[self.menuListInMur addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Final Diagnosis", @""), kTitleKey,
								   inMurFinalViewController, kViewControllerKey,
								   nil]];
	


	[TestFlight passCheckpoint:@"22-FD"];
	
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