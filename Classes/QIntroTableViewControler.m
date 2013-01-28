//
//  QIntroTableViewControler.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 10-08-03.
//  Copyright 2010 DeVry Healthcare Group Center for Excellence in Simulation. All rights reserved.
//

#import "QIntroTableViewControler.h"
#import "IntroLungSoundsViewController.h"
#import "IntroHeartSoundsViewController.h"
#import "IntroAppearenceViewController.h"
#import "IntroJVPViewController.h"
#import "IntroAPViewController.h"
#import "IntroPreCordViewController.h"
#import "IntroFinalDViewController.h"

static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";


@implementation QIntroTableViewControler
@synthesize menuListIntro;

- (void)viewDidLoad
{	
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuListIntro = [NSMutableArray array];
	
	// Appearance: **************************** //
	IntroAppearenceViewController *introAppearenceViewController = [[IntroAppearenceViewController alloc]
																	initWithNibName:@"IntroAppearenceViewController" bundle:nil];
	[introAppearenceViewController setTitle:@"Appearance"];
	[self.menuListIntro addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Appearance", @""), kTitleKey,
								   introAppearenceViewController, kViewControllerKey,
								   nil]];
	
	[introAppearenceViewController release];
	
	// J.V.P. : **************************** //
	IntroJVPViewController *introJVPViewController = [[IntroJVPViewController alloc]
													  initWithNibName:@"IntroJVPViewController" bundle:nil];
	[introJVPViewController setTitle:@"Jugular Venous Pulse"];
	[self.menuListIntro addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Jugular Venous Pulse", @""), kTitleKey,
								   introJVPViewController, kViewControllerKey,
								   nil]];
	
	[introJVPViewController release];
	
	
	// Arterial Pulse : **************************** //
	IntroAPViewController *introAPViewController = [[IntroAPViewController alloc]
													initWithNibName:@"IntroAPViewController" bundle:nil];
	[introAPViewController setTitle:@"Arterial Pulse"];
	[self.menuListIntro addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Arterial Pulse", @""), kTitleKey,
								   introAPViewController, kViewControllerKey,
								   nil]];
	
	[introAPViewController release];
	
	
	
	// Precordial Movements : **************************** //
	IntroPreCordViewController *introPreCordViewController = [[IntroPreCordViewController alloc]
															  initWithNibName:@"IntroPreCordViewController" bundle:nil];
	[introPreCordViewController setTitle:@"Precordial Movements"];
	[self.menuListIntro addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Precordial Movements", @""), kTitleKey,
								   introPreCordViewController, kViewControllerKey,
								   nil]];
	
	[introPreCordViewController release];
	
	// Cardiac Auscultation: ***************************** // 
	
	IntroHeartSoundsViewController *introHeartSoundsViewController = [[IntroHeartSoundsViewController alloc]
																	  initWithNibName:@"IntroHeartSoundsViewController" bundle:nil];
	[introHeartSoundsViewController setTitle:@"Cardiac Auscultation"];
	[self.menuListIntro addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Cardiac Auscultation", @""), kTitleKey,
								   introHeartSoundsViewController, kViewControllerKey,
								   nil]];
	
	[introHeartSoundsViewController release];
	
	
	// Pulmonary Auscultation: ***************************** // 
	
	IntroLungSoundsViewController *introLungSoundsViewController = [[IntroLungSoundsViewController alloc]
																	initWithNibName:@"IntroLungSoundsViewController" bundle:nil];
	[introLungSoundsViewController setTitle:@"Pulmonary Auscultation"];
	[self.menuListIntro addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Pulmonary Auscultation", @""), kTitleKey,
								   introLungSoundsViewController, kViewControllerKey,
								   nil]];
	
	[introLungSoundsViewController release];
	
	
	// Final Diagnosis: ***************************** // 
	
		 IntroFinalDViewController *introFinalDViewController = [[IntroFinalDViewController alloc]
	 initWithNibName:@"IntroFinalDViewController" bundle:nil];
	 [introFinalDViewController setTitle:@"Your Diagnosis:"];
	 [self.menuListIntro addObject:[NSDictionary dictionaryWithObjectsAndKeys:
	 NSLocalizedString(@"Final Diagnosis ?", @""), kTitleKey,
	 introFinalDViewController, kViewControllerKey,
	 nil]];
	 
	 [introFinalDViewController release];
	 
	 
	 
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
	
	self.menuListIntro = nil;
}

- (void)dealloc
{
	[menuListIntro release];	
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
	UIViewController *targetViewController = [[self.menuListIntro objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark -
#pragma mark UITableViewDataSource

// tell our table how many rows it will have, in our case the size of our menuListIntro
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuListIntro count];
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
	
	cell.textLabel.text = [[self.menuListIntro objectAtIndex:indexPath.row] objectForKey:kTitleKey];
	
	return cell;
}




@end