//
//  AngPecPreCordViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-30.
//
//

#import "AngPecPreCordViewController.h"

@interface AngPecPreCordViewController ()

@end

@implementation AngPecPreCordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [scrollJVPView setScrollEnabled:YES];
    [scrollJVPView setContentSize:CGSizeMake(320, 600)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
