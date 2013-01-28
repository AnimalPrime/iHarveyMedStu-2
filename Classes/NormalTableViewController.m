//
//  NormalTableViewController.m
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//

#import "NormalTableViewController.h"
#import "NormalLungSoundsViewController.h"
#import "NormalHeartSoundsViewController.h"
#import "NormalAppearenceViewController.h"
#import "NormalJVPViewController.h"
#import "NormalAPViewController.h"
#import "NormalPreCordViewController.h"
#import "NormalFinalViewController.h"

static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";

@implementation NormalTableViewController
@synthesize menuListNormal;

- (void)viewDidLoad
{	
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	
	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuListNormal = [NSMutableArray array];
	
	// Appearence: **************************** //
	NormalAppearenceViewController *normalAppearenceViewController = [[NormalAppearenceViewController alloc]
																	initWithNibName:@"NormalAppearenceViewController" bundle:nil];
	[normalAppearenceViewController setTitle:@"Appearance"];
	[self.menuListNormal addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Appearance", @""), kTitleKey,
								   normalAppearenceViewController, kViewControllerKey,
								   nil]];
	[TestFlight passCheckpoint:@"46-App"];
	
    [normalAppearenceViewController release];
	
	
	
	// J.V.P. : **************************** //
	NormalJVPViewController *normalJVPViewController = [[NormalJVPViewController alloc]
													  initWithNibName:@"NormalJVPViewController" bundle:nil];
	[normalJVPViewController setTitle:@"Jugular Venous Pulse"];
	[self.menuListNormal addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Jugular Venous Pulse", @""), kTitleKey,
								   normalJVPViewController, kViewControllerKey,
								   nil]];
	
	[TestFlight passCheckpoint:@"46-JVP"];
    
    [normalJVPViewController release];
	
	
	// Arterial Pulse : **************************** //
	NormalAPViewController *normalAPViewController = [[NormalAPViewController alloc]
													initWithNibName:@"NormalAPViewController" bundle:nil];
    [normalAPViewController setTitle:@"Arterial Pulse"];
	[self.menuListNormal addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Arterial Pulse", @""), kTitleKey,
								   normalAPViewController, kViewControllerKey,
								   nil]];
	[TestFlight passCheckpoint:@"46-ArtP"];
	
    [normalAPViewController release];

	
	
	// Precordial Movements : **************************** //
    NormalPreCordViewController *normalPreCordViewController = [[NormalPreCordViewController alloc]
															  initWithNibName:@"NormalPreCordViewController" bundle:nil];
	[normalPreCordViewController setTitle:@"Precordial Movements"];
	[self.menuListNormal addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Precordial Movements", @""), kTitleKey,
								   normalPreCordViewController, kViewControllerKey,
								   nil]];
	
    [TestFlight passCheckpoint:@"46-PreCor"];
    
	[normalPreCordViewController release];
	
	
	
	
	// Heart Sounds: ***************************** // 
	
	NormalHeartSoundsViewController *normalHeartSoundsViewController = [[NormalHeartSoundsViewController alloc]
																	  initWithNibName:@"NormalHeartSoundsViewController" bundle:nil];
	[normalHeartSoundsViewController setTitle:@"Cardiac Auscultation"];
	[self.menuListNormal addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Cardiac Auscultation", @""), kTitleKey,
								   normalHeartSoundsViewController, kViewControllerKey,
								   nil]];
	
    [TestFlight passCheckpoint:@"46-HS"];
	
    [normalHeartSoundsViewController release];
	
	
	// Lung Sounds: ***************************** // 
	
	NormalLungSoundsViewController *normalLungSoundsViewController = [[NormalLungSoundsViewController alloc]
																	initWithNibName:@"NormalLungSoundsViewController" bundle:nil];
	[normalLungSoundsViewController setTitle:@"Pulmonary Auscultation"];
	[self.menuListNormal addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Pulmonary Auscultation", @""), kTitleKey,
								   normalLungSoundsViewController, kViewControllerKey,
								   nil]];
	
	
    [TestFlight passCheckpoint:@"46-LS"];
    
    [normalLungSoundsViewController release];
	
	
	// Final Diagnosis: ***************************** // 
	
	NormalFinalViewController *normalFinalViewController = [[NormalFinalViewController alloc]
														  initWithNibName:@"NormalFinalViewController" bundle:nil];
	[normalFinalViewController setTitle:@"Final Diagnosis"];
	[self.menuListNormal addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Final Diagnosis", @""), kTitleKey,
								   normalFinalViewController, kViewControllerKey,
								   nil]];
	
	[TestFlight passCheckpoint:@"46-Fd"];
    
    [normalFinalViewController release];
	
	
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
	
	self.menuListNormal = nil;
}

- (void)dealloc
{
	[menuListNormal release];	
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
	UIViewController *targetViewController = [[self.menuListNormal objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark -
#pragma mark UITableViewDataSource

// tell our table how many rows it will have, in our case the size of our menuListNormal
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuListNormal count];
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
	
	cell.textLabel.text = [[self.menuListNormal objectAtIndex:indexPath.row] objectForKey:kTitleKey];
	
	return cell;
}




@end
