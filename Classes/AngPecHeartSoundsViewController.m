//
//  AngPecHeartSoundsViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-30.
//
//

#import "AngPecHeartSoundsViewController.h"

#import "AngPecHSInfoViewController.h"


@interface AngPecHeartSoundsViewController ()

@end

@implementation AngPecHeartSoundsViewController

-(IBAction)playa{
	NSLog(@"PLAY AORTIC");
	[TestFlight passCheckpoint:@"39 - HS - Play Aor"];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/a39.mp3", [[NSBundle mainBundle] resourcePath]]];
	
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
	[TestFlight passCheckpoint:@"39 - HS - Play Pul"];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/p39.mp3", [[NSBundle mainBundle] resourcePath]]];
	
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

-(IBAction)playm{
	NSLog(@"PLAY MITRAL");
	[TestFlight passCheckpoint:@"39 - HS - Play Mit"];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/m39.mp3", [[NSBundle mainBundle] resourcePath]]];
	
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

-(IBAction)playt{
	NSLog(@"PLAY TRICUSPID");
	[TestFlight passCheckpoint:@"39 - HS - Play Tri"];
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/t39.mp3", [[NSBundle mainBundle] resourcePath]]];
	
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




-(IBAction)flipinfo{
	
    [TestFlight passCheckpoint:@"39 - HSInfo"];
	
    AngPecHSInfoViewController *infohs = [[AngPecHSInfoViewController alloc] initWithNibName:nil bundle:nil];
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

