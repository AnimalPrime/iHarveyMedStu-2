//
//  AorValSclHSInfoViewController.m
//  IHarvey
//
//  Created by Reid Adams on 10-07-25.
//  Copyright 2010 RUSM. All rights reserved.
//

#import "AorValSclHSInfoViewController.h"


@implementation AorValSclHSInfoViewController




-(IBAction)donebuttonpress {
	
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)vidplay {
	
	NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"S1-S2 Filling Animation" ofType:@"mov"];
	
	MPMoviePlayerController *player = 
	[[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoURL]];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(movieFinishedCallback:) 
												 name: MPMoviePlayerPlaybackDidFinishNotification 
											   object:player];
	
	
	UIView * movieView = [player view];
	[movieView setFrame: CGRectMake(0, 0, 320, 480)];
	
	player.scalingMode = MPMovieScalingModeAspectFit;
	player.fullscreen = TRUE;
	player.controlStyle = MPMovieControlStyleFullscreen;
	player.shouldAutoplay = TRUE;
	
	
	
	[[[UIApplication sharedApplication] keyWindow] addSubview: movieView];
	
}

-(IBAction)pvidp {
	
	NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"pul" ofType:@"mov"];
	
	MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoURL]];
	
	
	
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(movieFinishedCallback:) 
												 name: MPMoviePlayerPlaybackDidFinishNotification 
											   object:player];
	
	
	
	UIView * movieView = [player view];
	[movieView setFrame: CGRectMake(0, 0, 320, 480)];
	
	player.scalingMode = MPMovieScalingModeAspectFit;
	player.fullscreen = TRUE;
	player.controlStyle = MPMovieControlStyleFullscreen;
	player.shouldAutoplay = TRUE;

	
	[[[UIApplication sharedApplication] keyWindow] addSubview: movieView];
	
}



-(IBAction)pvidt {
	
	NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"tri" ofType:@"mov"];
	
	MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoURL]];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinishedCallback:) name: MPMoviePlayerPlaybackDidFinishNotification object:player];
	player.scalingMode = MPMovieScalingModeAspectFill;
	
	UIView * movieView = [player view];
	[movieView setFrame: CGRectMake(0, 0, 320, 480)];
	
	player.scalingMode = MPMovieScalingModeAspectFit;
	player.fullscreen = TRUE;
	player.controlStyle = MPMovieControlStyleFullscreen;
	player.shouldAutoplay = TRUE;
	
	[[[UIApplication sharedApplication] keyWindow] addSubview: movieView];	
	
	
}

-(IBAction)pvidm {
	
	NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"mit" ofType:@"mov"];
	
	MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoURL]];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinishedCallback:) name: MPMoviePlayerPlaybackDidFinishNotification object:player];
	player.scalingMode = MPMovieScalingModeAspectFill;
	
	UIView * movieView = [player view];
	[movieView setFrame: CGRectMake(0, 0, 320, 480)];
	
	player.scalingMode = MPMovieScalingModeAspectFit;
	player.fullscreen = TRUE;
	player.controlStyle = MPMovieControlStyleFullscreen;
	player.shouldAutoplay = TRUE;
	[player release];
	
	[[[UIApplication sharedApplication] keyWindow] addSubview: movieView];	
	
	
}





- (void)movieFinishedCallback:(NSNotification*)aNotification{
	
	MPMoviePlayerController* player = [aNotification object];
	[[NSNotificationCenter defaultCenter] removeObserver: self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
	
	[player.view removeFromSuperview];
	
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


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	[scrollView setScrollEnabled:YES];
	
	[scrollView setContentSize:CGSizeMake(320, 2850)]; 
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
