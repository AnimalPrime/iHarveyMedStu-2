//
//  QuizViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 10-08-03.
//  Copyright 2010 DeVry Healthcare Group Center for Excellence in Simulation. All rights reserved.
//

#import "QuizViewController.h"
#import "ProSelTableViewController.h"
#import "QIntroTableViewControler.h"
#import "QNormalTableViewController.h"
#import "QInMurTableViewController.h"
#import "QAorValSclTableViewController.h"
#import "QHypTenTableViewController.h"
#import "QAngPecTableViewController.h"
#import "AIMITableViewController.h"



static NSString *kTitleKey = @"title";
static NSString *kViewControllerKey = @"viewController";

@implementation QuizViewController
@synthesize menuListQuiz;

- (void)viewDidLoad
{	
	[super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	self.title = @"Select Program";
	
	// construct the array of page descriptions we will use (each description is a dictionary)
	//
	self.menuListQuiz = [NSMutableArray array];
	
	// 44 - Intro Program: **************************** //
	QIntroTableViewControler *introTableViewController = [[QIntroTableViewControler alloc]
	
														   initWithNibName:@"QIntroTableViewControler" bundle:nil];
	[introTableViewController setTitle:@"???????"];
	[self.menuListQuiz  addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									 NSLocalizedString(@"I??????", @""), kTitleKey,
									 introTableViewController, kViewControllerKey,
									 nil]];
	
    [TestFlight passCheckpoint:@"Quiz 44"];
    
	[introTableViewController release];
	
	// 46 - Normal Program: ***************************** // 
	
	QNormalTableViewController *normalTableViewController = [[QNormalTableViewController alloc]
															initWithNibName:@"QNormalTableViewController" bundle:nil];
	[normalTableViewController setTitle:@"???????"];
	[self.menuListQuiz  addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									 NSLocalizedString(@"N???????", @""), kTitleKey,
									 normalTableViewController, kViewControllerKey,
									 nil]];
	
	[TestFlight passCheckpoint:@"Quiz 46"];
    
    [normalTableViewController release];
	
	// 22 - Innocent Murmer: ***************************** // 
	
	QInMurTableViewController *inMurTableViewController = [[QInMurTableViewController alloc]
														  initWithNibName:@"QInMurTableViewController" bundle:nil];
	[inMurTableViewController setTitle:@"???????"];
	[self.menuListQuiz  addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									 NSLocalizedString(@"M???????", @""), kTitleKey,
									 inMurTableViewController, kViewControllerKey,
									 nil]];
	
	[TestFlight passCheckpoint:@"Quiz 22"];
    [inMurTableViewController release];
	
	// 49 - Aortic Valve Sclerosis: ***************************** // 
	
	QAorValSclTableViewController *aorValSclTableViewController = [[QAorValSclTableViewController alloc]
																  initWithNibName:@"QAorValSclTableViewController" bundle:nil];
	[aorValSclTableViewController setTitle:@"???????"];
	[self.menuListQuiz addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"AL???????", @""), kTitleKey,
									aorValSclTableViewController, kViewControllerKey,
									nil]];
	
    [TestFlight passCheckpoint:@"Quiz 49"];
    
	[aorValSclTableViewController release];
	
	
	// 36 - Hypertension: ***************************** // 
	
	QHypTenTableViewController *qhypTenTableViewController = [[QHypTenTableViewController alloc]
															initWithNibName:@"QHypTenTableViewController" bundle:nil];
	[qhypTenTableViewController setTitle:@"???????"];
	[self.menuListQuiz addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"HT???????", @""), kTitleKey,
									qhypTenTableViewController, kViewControllerKey,
									nil]];
	
	[TestFlight passCheckpoint:@"Quiz 36"];
    
    [qhypTenTableViewController release];
	
	
	// 39 - Angina Pectoris: ***************************** // 
	
	
	QAngPecTableViewController *qangPecTableViewController = [[QAngPecTableViewController alloc]
															initWithNibName:@"QAngPecTableViewController" bundle:nil];
	[qangPecTableViewController setTitle:@"???????"];
	[self.menuListQuiz addObject:[NSDictionary dictionaryWithObjectsAndKeys:
									NSLocalizedString(@"AP???????", @""), kTitleKey,
									qangPecTableViewController, kViewControllerKey,
									nil]];
	
	
    [TestFlight passCheckpoint:@"Quiz 39"];
    
    [qangPecTableViewController release];
	
	
	// 43 - Acute Inferior Myocardial Infarction: ***************************** // 
	/*
	
	AIMITableViewController *aimiTableViewController = [[AIMITableViewController alloc]
														initWithNibName:@"AIMITableViewController" bundle:nil];
	[aimiTableViewController setTitle:@"43 - Acute Inferior M.I."];
	[self.menuListQuiz addObject:[NSDictionary dictionaryWithObjectsAndKeys:
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
	
	int randIdx = random() % [menuListQuiz count];
 	
UIViewController *targetViewController = [[self.menuListQuiz objectAtIndex: randIdx] objectForKey:kViewControllerKey];
	
	[[self navigationController] pushViewController:targetViewController animated:YES];
	
	
	
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
		NSLog(@"ended");  
	
	
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
		NSLog(@"shake cancelled");
	
	
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
