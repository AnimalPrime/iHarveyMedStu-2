//
//  HypTenPreCordViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-29.
//
//

#import "HypTenPreCordViewController.h"

@interface HypTenPreCordViewController ()

@end

@implementation HypTenPreCordViewController

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
    [scrollPCView setScrollEnabled:YES];
	[scrollPCView setContentSize:CGSizeMake(320, 650)];
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
