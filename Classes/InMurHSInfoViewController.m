//
//  InMurHSInfoViewController.m
//  IHarvey
//
//  Created by Reid Adams on 10-07-23.
//  Copyright 2010 RUSM. All rights reserved.
//

#import "InMurHSInfoViewController.h"
#import "InMurHeartSoundsViewContoller.h"


#define degreesToRadian(x) (M_PI * (x)/180.0)

@implementation InMurHSInfoViewController




-(IBAction)donebuttonpress {
    
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)vidplay {
    
    [TestFlight passCheckpoint:@"22 - HSinfo - Vid Play Aor"];
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
	[TestFlight passCheckpoint:@"22 - HSinfo - Vid Play Pul"];
    
	NSLog(@"PLAY MITRAL");
	
	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/p22.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 1;
	
	if (audioPlayer == nil)
		NSLog(@"3");
    else
        [audioPlayer play];
	
}	



-(IBAction)pvidt {
	[TestFlight passCheckpoint:@"22 - HSinfo - Vid Play Tri"];
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"tri" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pvidtPlaybackComplete:)
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
    
    [TestFlight passCheckpoint:@"22 - HSinfo - Vid Play Mit"];
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"S3" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(pvidmPlaybackComplete:)
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
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[scrollView setScrollEnabled:YES];
	
	[scrollView setContentSize:CGSizeMake(320, 3100)]; 
	
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
