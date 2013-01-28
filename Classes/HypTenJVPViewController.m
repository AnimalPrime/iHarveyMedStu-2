//
//  HypTenJVPViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-29.
//
//

#import "HypTenJVPViewController.h"

@interface HypTenJVPViewController ()

@end

@implementation HypTenJVPViewController

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
    [scrollJVPView setContentSize:CGSizeMake(320, 750)];
    [super viewDidLoad];
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
