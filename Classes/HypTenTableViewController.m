//
//  HypTenTableViewController.m
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//

#import "HypTenTableViewController.h"

#import "HypTenLungSoundsViewController.h"
#import "HypTenHeartSoundsViewController.h"
#import "HypTenAppearanceViewController.h"
#import "HypTenJVPViewController.h"
#import "HypTenAPViewController.h"
#import "HypTenPreCordViewController.h"
#import "HypTenFinalViewController.h"

static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";


@implementation HypTenTableViewController
@synthesize menuListHypTen;

- (void)viewDidLoad
{	
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	
	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuListHypTen = [NSMutableArray array];
	
	// Appearence: **************************** //
	HypTenAppearanceViewController *appearenceViewController = [[HypTenAppearanceViewController alloc]
																	  initWithNibName:@"HypTenAppearanceViewController" bundle:nil];
	[appearenceViewController setTitle:@"Appearance"];
	[self.menuListHypTen addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"Appearance", @""), kTitleKey,
									appearenceViewController, kViewControllerKey,
									nil]];
	
	[TestFlight passCheckpoint:@"36-App"];
    [appearenceViewController release];
	
	
	
	// J.V.P. : **************************** //
	HypTenJVPViewController *hyptenJVPViewController = [[HypTenJVPViewController alloc]
														initWithNibName:@"HypTenJVPViewController" bundle:nil];
	[hyptenJVPViewController setTitle:@"Jugular Venous Pulse"];
	[self.menuListHypTen addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"Jugular Venous Pulse", @""), kTitleKey,
									hyptenJVPViewController, kViewControllerKey,
									nil]];
	
	[TestFlight passCheckpoint:@"36-JVP"];
    
    [hyptenJVPViewController release];

	
	// Arterial Pulse : **************************** //
	HypTenAPViewController *hyptenAPViewController = [[HypTenAPViewController alloc]
													  initWithNibName:@"HypTenAPViewController" bundle:nil];
    [hyptenAPViewController setTitle:@"Arterial Pulse"];
	[self.menuListHypTen addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"Arterial Pulse", @""), kTitleKey,
									hyptenAPViewController, kViewControllerKey,
									nil]];
	
	[TestFlight passCheckpoint:@"36-ArtP"];
    
    [hyptenAPViewController release];
	
	
	
	// Precordial Movements : **************************** //
    HypTenPreCordViewController *hyptenPreCordViewController = [[HypTenPreCordViewController alloc]
																initWithNibName:@"HypTenPreCordViewController" bundle:nil];
	[hyptenPreCordViewController setTitle:@"Precordial Movements"];
	[self.menuListHypTen addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"Precordial Movements", @""), kTitleKey,
									hyptenPreCordViewController, kViewControllerKey,
									nil]];
	
	[TestFlight passCheckpoint:@"36-PreCor"];
    
    [hyptenPreCordViewController release];
	
	
	
	
	// Heart Sounds: ***************************** // 
	
	HypTenHeartSoundsViewController *hyptenHeartSoundsViewController = [[HypTenHeartSoundsViewController alloc]
																		initWithNibName:@"HypTenHeartSoundsViewController" bundle:nil];
	[hyptenHeartSoundsViewController setTitle:@"Cardiac Auscultation"];
	[self.menuListHypTen addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"Cardiac Auscultation", @""), kTitleKey,
									hyptenHeartSoundsViewController, kViewControllerKey,
									nil]];
	
	
    [TestFlight passCheckpoint:@"36-HS"];
    [hyptenHeartSoundsViewController release];
	
	
	// Lung Sounds: ***************************** // 
	
	HypTenLungSoundsViewController *hyptenLungSoundsViewController = [[HypTenLungSoundsViewController alloc]
																	  initWithNibName:@"HypTenLungSoundsViewController" bundle:nil];
	[hyptenLungSoundsViewController setTitle:@"Pulmonary Auscultation"];
	[self.menuListHypTen addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"Pulmonary Auscultation", @""), kTitleKey,
									hyptenLungSoundsViewController, kViewControllerKey,
									nil]];
	
	
    [TestFlight passCheckpoint:@"36-LS"];
    [hyptenLungSoundsViewController release];
	

	// Final Diagnosis: ***************************** // 
	
	HypTenFinalViewController *hyptenFinalViewController = [[HypTenFinalViewController alloc]
															initWithNibName:@"HypTenFinalViewController" bundle:nil];
	[hyptenFinalViewController setTitle:@"Final Diagnosis"];
	[self.menuListHypTen addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"Final Diagnosis", @""), kTitleKey,
									hyptenFinalViewController, kViewControllerKey,
									nil]];
	
	[TestFlight passCheckpoint:@"36-FD"];
    
    [hyptenFinalViewController release];
	
	
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
	
	self.menuListHypTen = nil;
}

- (void)dealloc
{
	[menuListHypTen release];	
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
	UIViewController *targetViewController = [[self.menuListHypTen objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark -
#pragma mark UITableViewDataSource

// tell our table how many rows it will have, in our case the size of our menuListNormal
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuListHypTen count];
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
	
	cell.textLabel.text = [[self.menuListHypTen objectAtIndex:indexPath.row] objectForKey:kTitleKey];
	
	return cell;
}




@end
