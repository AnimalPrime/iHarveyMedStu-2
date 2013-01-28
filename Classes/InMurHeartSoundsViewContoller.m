//
//  InMurHeartSoundsViewContoller.m
//  IHarvey
//
//  Created by Reid Adams on 10-07-23.
//  Copyright 2010 RUSM. All rights reserved.
//

#import "InMurHeartSoundsViewContoller.h"
#import "InMurHSInfoViewController.h"

@implementation InMurHeartSoundsViewContoller

-(IBAction)playa{
	NSLog(@"PLAY AORTIC");
	[TestFlight passCheckpoint:@"22 - HS - Aor"];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/m44.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"1");				
		else 
			[audioPlayer play];
	
	
}	

-(IBAction)stopa {
	NSLog(@"STOP AORTIC");
	
	[audioPlayer stop];
	
	
}

-(IBAction)playp {
	
	NSLog(@"PLAY PUlMONIC");
	[TestFlight passCheckpoint:@"22 - HS - Pul"];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/p22.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"2");				
		else 
			[audioPlayer play];
	
}

-(IBAction)stopp{
	
	NSLog(@"STOP PUlMONIC");
	[audioPlayer stop];
	
	
	
}

-(IBAction)playt{
	NSLog(@"PLAY TRICUSPID");
	[TestFlight passCheckpoint:@"22 - HS - Tri"];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/t44.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"4");				
	else 
		[audioPlayer play];
	
	
}	

-(IBAction)stopt {
	NSLog(@"STOP TRICUSPID");
	
	[audioPlayer stop];
	
	
}
 
-(IBAction)playm{
	NSLog(@"PLAY MITRAL");
    [TestFlight passCheckpoint:@"22 - HS - Mit"];
	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/m46.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"3");				
		else 
			[audioPlayer play];
	
}	

-(IBAction)stopm {
	NSLog(@"STOP MITRAL");
	
	[audioPlayer stop];
	
	
}




-(IBAction)flipinfo{
	
	[TestFlight passCheckpoint:@"44 - HSInfo"];
    InMurHSInfoViewController *infohs = [[InMurHSInfoViewController alloc] initWithNibName:nil bundle:nil];
	infohs.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:infohs animated:YES];
	
	[infohs release];
	[audioPlayer stop];
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
	[audioPlayer stop];
	
}


- (void)dealloc {
    [super dealloc];
	
	
	
}




@end