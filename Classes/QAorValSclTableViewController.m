//
//  QAorValSclTableViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 10-08-06.
//  Copyright 2010 DeVry Healthcare Group Center for Excellence in Simulation. All rights reserved.
//

#import "QAorValSclTableViewController.h"
#import "AorValSclTableViewController.h"
#import "IntroLungSoundsViewController.h"
#import "AorValSclHeartSounds.h"
#import "AorValSclAppearanceViewController.h"
#import "AorValSclJVPViewController.h"
#import "AorValSclAPViewController.h"
#import "AorValSlcPreCorViewController.h"
#import "QAorValSclFinalViewController.h"

static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";


@implementation QAorValSclTableViewController
@synthesize menuListAorValScl;

- (void)viewDidLoad
{	
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuListAorValScl = [NSMutableArray array];
	
	// Appearance: **************************** //
	AorValSclAppearanceViewController *aorValSclAppearenceViewController = [[AorValSclAppearanceViewController alloc]
																			initWithNibName:@"AorValSclAppearanceViewController" bundle:nil];
	[aorValSclAppearenceViewController setTitle:@"Appearance"];
	[self.menuListAorValScl addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									   NSLocalizedString(@"Appearance", @""), kTitleKey,
									   aorValSclAppearenceViewController, kViewControllerKey,
									   nil]];
	
	[aorValSclAppearenceViewController release];
	
	// J.V.P. : **************************** //
	AorValSclJVPViewController *aorValSclJVPViewController = [[AorValSclJVPViewController alloc]
															  initWithNibName:@"AorValSclJVPViewController" bundle:nil];
	[aorValSclJVPViewController setTitle:@"Jugular Venous Pulse"];
	[self.menuListAorValScl addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									   NSLocalizedString(@"Jugular Venous Pulse", @""), kTitleKey,
									   aorValSclJVPViewController, kViewControllerKey,
									   nil]];
	
	[aorValSclJVPViewController release];
	
	
	// Arterial Pulse : **************************** //
	AorValSclAPViewController *aorValSclAPViewController = [[AorValSclAPViewController alloc]
															initWithNibName:@"AorValSclAPViewController" bundle:nil];
	[aorValSclAPViewController setTitle:@"Arterial Pulse"];
	[self.menuListAorValScl addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									   NSLocalizedString(@"Arterial Pulse", @""), kTitleKey,
									   aorValSclAPViewController, kViewControllerKey,
									   nil]];
	
	[aorValSclAPViewController release];
	
	
	
	// Precordial Movements : **************************** //
	AorValSlcPreCorViewController *aorValSclPreCorViewController = [[AorValSlcPreCorViewController alloc]
																	initWithNibName:@"AorValSlcPreCorViewController" bundle:nil];
	[aorValSclPreCorViewController setTitle:@"Precordial Movements"];
	[self.menuListAorValScl addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									   NSLocalizedString(@"Precordial Movements", @""), kTitleKey,
									   aorValSclPreCorViewController, kViewControllerKey,
									   nil]];
	
	[aorValSclPreCorViewController release];
	
	
	
	// Cardiac Auscultation: ***************************** // 
	
	AorValSclHeartSounds *aorValSclHeartSounds = [[AorValSclHeartSounds alloc]
												  initWithNibName:@"AorValSclHeartSounds" bundle:nil];
	[aorValSclHeartSounds setTitle:@"Cardiac Auscultation"];
	[self.menuListAorValScl addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									   NSLocalizedString(@"Cardiac Auscultation", @""), kTitleKey,
									   aorValSclHeartSounds, kViewControllerKey,
									   nil]];
	
	[aorValSclHeartSounds release];
	
	
	
	// Pulmonary Auscultation: ***************************** // 
	
	IntroLungSoundsViewController *introLungSoundsViewController = [[IntroLungSoundsViewController alloc]
																	initWithNibName:@"IntroLungSoundsViewController" bundle:nil];
	[introLungSoundsViewController setTitle:@"Pulmonary Auscultation"];
	[self.menuListAorValScl addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									   NSLocalizedString(@"Pulmonary Auscultation", @""), kTitleKey,
									   introLungSoundsViewController, kViewControllerKey,
									   nil]];
	
	[introLungSoundsViewController release];
	
	
	// Final Diagnosis: ***************************** // 
	
	QAorValSclFinalViewController *qaorValSclFinalViewController = [[QAorValSclFinalViewController alloc]
																  initWithNibName:@"QAorValSclFinalViewController" bundle:nil];
	[qaorValSclFinalViewController setTitle:@"Final Diagnosis"];
	[self.menuListAorValScl addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									   NSLocalizedString(@"Final Diagnosis", @""), kTitleKey,
									   qaorValSclFinalViewController, kViewControllerKey,
									   nil]];
	
	[qaorValSclFinalViewController release];
	
	
	
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
	
	self.menuListAorValScl = nil;
}

- (void)dealloc
{
	[menuListAorValScl release];	
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
	UIViewController *targetViewController = [[self.menuListAorValScl objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark -
#pragma mark UITableViewDataSource

// tell our table how many rows it will have, in our case the size of our menuListIntro
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuListAorValScl count];
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
	
	cell.textLabel.text = [[self.menuListAorValScl objectAtIndex:indexPath.row] objectForKey:kTitleKey];
	
	return cell;
}




@end