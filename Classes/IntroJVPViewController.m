//
//  IntroJVPViewController.m
//  IHarvey
//
//  Created by Reid Adams on 6/20/10.
//  Copyright 2010 RUSM All rights reserved.
//

#import "IntroJVPViewController.h"


@implementation IntroJVPViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/



- (void)viewDidLoad {
    [super viewDidLoad];
		
		[scrollJVPView setScrollEnabled:YES];
		[scrollJVPView setContentSize:CGSizeMake(320, 1150)];  
}
	
	
	


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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
