//
//  IntroLungSoundsViewController.m
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//

#import "IntroLungSoundsViewController.h"
#import "IntroLSInfoViewController.h"


@implementation IntroLungSoundsViewController

-(IBAction)playr1{

	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/44Lung.m4a", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil) {
		NSLog(@"1");
		[audioPlayer release];
	}
	
	else { 
		[audioPlayer play];
	}
	
}	

-(IBAction)stopr1 {
	
	[audioPlayer stop];
	
}


-(IBAction)playr2{
	
	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/44Lung.m4a", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"2");				
	else 
		[audioPlayer play];
	
}	

-(IBAction)stopr2 {
	
	
	[audioPlayer stop];
	
}

-(IBAction)playr3{
	
	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/44Lung.m4a", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"3");				
	else 
		[audioPlayer play];
	
}	

-(IBAction)stopr3 {
	
	
	[audioPlayer stop];
	
}


-(IBAction)playl1{
	
	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/44Lung.m4a", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"4");				
	else 
		[audioPlayer play];
	
}	

-(IBAction)stopl1 {
	
	
	[audioPlayer stop];
	
	
}


-(IBAction)playl2{
	

	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/44Lung.m4a", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"5");				
	else 
		[audioPlayer play];
	
}	

-(IBAction)stopl2 {
	
	
	[audioPlayer stop];
	}

-(IBAction)playl3{
	
	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/44Lung.m4a", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"6");				
	else 
		[audioPlayer play];
	
}	

-(IBAction)stopl3 {
	
	
	[audioPlayer stop];
	
}



-(IBAction)flipinfo{
	
	IntroLSInfoViewController *infols = [[IntroLSInfoViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:infols animated:YES];
	[audioPlayer stop];
	
	[infols release];
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
	[audioPlayer stop];
}


- (void)dealloc {
    [super dealloc];
	
}


@end
