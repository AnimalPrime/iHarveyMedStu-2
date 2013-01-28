//
//  IntroShakeViewController.m
//  IHarvey
//
//  Created by Reid Adams on 10-08-02.
//  Copyright 2010 Ross University School of Medicine. All rights reserved.
//

#import "IntroShakeViewController.h"
#import "IntroTableViewController.h"
#import "IntroLungSoundsViewController.h"
#import "IntroHeartSoundsViewController.h"
#import "IntroAppearenceViewController.h" 
#import "IntroJVPViewController.h"
#import "IntroAPViewController.h"
#import "IntroPreCordViewController.h"
#import "IntroFinalViewController.h"
#import "IntroShakeViewController.h"
#import "IntroFinalDViewController.h"


static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";

@implementation IntroShakeViewController

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
	
	IntroFinalViewController *introFinalViewController = [[IntroFinalViewController alloc]
														  initWithNibName:@"IntroFinalViewController" bundle:nil];
	[introFinalViewController setTitle:@"Final Diagnosis"];
	[self.menuListIntro addObject:[NSDictionary dictionaryWithObjectsAndKeys:
								   NSLocalizedString(@"Final Diagnosis", @""), kTitleKey,
								   introFinalViewController, kViewControllerKey,
								   nil]];
	
	[introFinalViewController release];
	
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	
	[temporaryBarButtonItem release];
}
	




- (void)viewDidAppear:(BOOL)animated
{
	[self becomeFirstResponder];
	[super viewDidAppear:animated];
}




- (BOOL)canBecomeFirstResponder 
{
	return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
		NSLog(@"shake began");
	

 	
	UIViewController *targetViewController = [[self.menuListIntro objectAtIndex: random() % 6] objectForKey:kViewControllerKey];

	[[self navigationController] pushViewController:targetViewController animated:YES];
	
	

}


	
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];

}

@end
