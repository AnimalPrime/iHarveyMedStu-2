//
//  NormalHSInfoViewController.m
//  IHarvey
//
//  Created by Reid Adams on 10-07-20.
//  Copyright 2010 RUSM. All rights reserved.
//

#import "NormalHSInfoViewController.h"
#import "NormalHeartSoundsViewController.h"

#define degreesToRadian(x) (M_PI * (x)/180.0)



@implementation NormalHSInfoViewController

-(IBAction)donebuttonpress {
    
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)vidplay {
    [TestFlight passCheckpoint:@"46 - HSinfo - Vid Play Aor"];
    
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"S1-S2 Filling Animation" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
}

- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    
    [moviePlayerController.view removeFromSuperview];
    [moviePlayerController release];
       [[UIApplication sharedApplication] setStatusBarHidden:NO];
}



-(IBAction)pvidp {
	[TestFlight passCheckpoint:@"46 - HSinfo - Vid Play Pul"];
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"pul" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pvidpPlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
    
	
}


- (void)pvidpPlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    
    [moviePlayerController.view removeFromSuperview];
    [moviePlayerController release];
       [[UIApplication sharedApplication] setStatusBarHidden:NO];
}




-(IBAction)pvidt {
	[TestFlight passCheckpoint:@"46 - HSinfo - Vid Play Tri"];
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"tri" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pvidpPlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
    
	
}



- (void)pvidtPlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    
    [moviePlayerController.view removeFromSuperview];
    [moviePlayerController release];
       [[UIApplication sharedApplication] setStatusBarHidden:NO];
}



-(IBAction)pvidm {
    [TestFlight passCheckpoint:@"46 - HSinfo - Vid Play Mit"];
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"s3" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pvidpPlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
    
	
}



- (void)pvidmPlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    
    [moviePlayerController.view removeFromSuperview];
    [moviePlayerController release];
       [[UIApplication sharedApplication] setStatusBarHidden:NO];
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
	[scrollView setScrollEnabled:YES];
	
	[scrollView setContentSize:CGSizeMake(320, 3000)];
}

//

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
