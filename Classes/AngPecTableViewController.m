//
//  AngPecTableViewController.m
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//

#import "AngPecTableViewController.h"

#import "InMurTableViewController.h"
#import "IntroLungSoundsViewController.h"
#import "AngPecHeartSoundsViewController.h"
#import "AngPecAppearanceViewController.h"
#import "AngPecJVPViewController.h"
#import "AngPecAPViewController.h"
#import "AngPecPreCordViewController.h"
#import "AngPecFinalViewController.h"
#import "AngPecCarAusViewController.h"

static NSString *kCellIdentifier = @"MyIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";


@implementation AngPecTableViewController

@synthesize menuListAngPec;

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuListAngPec = [NSMutableArray array];
	
	// Appearance: **************************** //
	AngPecAppearanceViewController *angpecAppearenceViewController = [[AngPecAppearanceViewController alloc]
																	initWithNibName:@"AngPecAppearanceViewController" bundle:nil];
	[angpecAppearenceViewController setTitle:@"Appearance"];
	[self.menuListAngPec addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Appearance", @""), kTitleKey,
								   angpecAppearenceViewController, kViewControllerKey,
								   nil]];
	
    [TestFlight passCheckpoint:@"39-App"];
	
    [angpecAppearenceViewController release];
	
	// J.V.P. : *************************** //
	AngPecJVPViewController *angpecJVPViewController = [[AngPecJVPViewController alloc]
													  initWithNibName:@"AngPecJVPViewController" bundle:nil];
	[angpecJVPViewController setTitle:@"Jugular Venous Pulse"];
	[self.menuListAngPec addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Jugular Venous Pulse", @""), kTitleKey,
								   angpecJVPViewController, kViewControllerKey,
								   nil]];
	
	
    [TestFlight passCheckpoint:@"39-JVP"];
    [angpecJVPViewController release];
	

	//Arterial Pulse : **************************** //
	AngPecAPViewController *angpecAPViewController = [[AngPecAPViewController alloc]
                                                    initWithNibName:@"AngPecAPViewController" bundle:nil];
	[angpecAPViewController setTitle:@"Arterial Pulse"];
	[self.menuListAngPec addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Arterial Pulse", @""), kTitleKey,
								   angpecAPViewController, kViewControllerKey,
								   nil]];
    
	[TestFlight passCheckpoint:@"39-ArtP"];
    
    [angpecAPViewController release];
    
    
	// Precordial Movements : **************************** //
	AngPecPreCordViewController *angpecPreCorViewController = [[AngPecPreCordViewController alloc]
                                                            initWithNibName:@"AngPecPreCordViewController" bundle:nil];
	[angpecPreCorViewController setTitle:@"Precordial Movements"];
	[self.menuListAngPec addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Precordial Movements", @""), kTitleKey,
								   angpecPreCorViewController, kViewControllerKey,
								   nil]];
	
	[TestFlight passCheckpoint:@"39-PreCor"];
    
    [angpecPreCorViewController release];
    
  
	// Cardiac Auscultation: ***************************** //
	
	AngPecHeartSoundsViewController *angpecHeartSoundsViewController = [[AngPecHeartSoundsViewController alloc]
                                                                     initWithNibName:@"AngPecHeartSoundsViewController" bundle:nil];
	[angpecHeartSoundsViewController setTitle:@"Cardiac Auscultation"];
	[self.menuListAngPec addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Cardiac Auscultation", @""), kTitleKey,
								   angpecHeartSoundsViewController, kViewControllerKey,
								   nil]];
	
	[TestFlight passCheckpoint:@"39-HS"];
    [angpecHeartSoundsViewController release];
	
	
	// Carotid Auscultation: ***************************** //
	
	AngPecCarAusViewController *angpeccarausViewController = [[AngPecCarAusViewController alloc]
                                                                        initWithNibName:@"AngPecCarAusViewController" bundle:nil];
	[angpeccarausViewController setTitle:@"Carotid Auscultation"];
	[self.menuListAngPec addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                    NSLocalizedString(@"Carotid Auscultation", @""), kTitleKey,
                                    angpeccarausViewController, kViewControllerKey,
                                    nil]];
	
	[TestFlight passCheckpoint:@"39-Carotid Aus"];
    
    [angpeccarausViewController release];
    
    
    // Pulmonary Auscultation: ***************************** //
	
	IntroLungSoundsViewController *introLungSoundsViewController = [[IntroLungSoundsViewController alloc]
																	initWithNibName:@"IntroLungSoundsViewController" bundle:nil];
	[introLungSoundsViewController setTitle:@"Pulmonary Auscultation"];
	[self.menuListAngPec addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Pulmonary Auscultation", @""), kTitleKey,
								   introLungSoundsViewController, kViewControllerKey,
								   nil]];
	
    [TestFlight passCheckpoint:@"39-LS"];
    
	[introLungSoundsViewController release];
	

	
	// Final Diagnosis: ***************************** //
	
	AngPecFinalViewController *angpecFinalViewController = [[AngPecFinalViewController alloc]
														  initWithNibName:@"AngPecFinalViewController" bundle:nil];
	[angpecFinalViewController setTitle:@"Final Diagnosis"];
	[self.menuListAngPec addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Final Diagnosis", @""), kTitleKey,
								   angpecFinalViewController, kViewControllerKey,
								   nil]];
	
    
    
	[TestFlight passCheckpoint:@"39-FD"];
	
	[angpecFinalViewController release];
	
	
	
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
	
	self.menuListAngPec = nil;
}

- (void)dealloc
{
	[menuListAngPec release];
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
	UIViewController *targetViewController = [[self.menuListAngPec objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark -
#pragma mark UITableViewDataSource

// tell our table how many rows it will have, in our case the size of our menuListIntro
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuListAngPec count];
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
	
	cell.textLabel.text = [[self.menuListAngPec objectAtIndex:indexPath.row] objectForKey:kTitleKey];
	
	return cell;
}





@end