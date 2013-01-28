//
//  HypTenAPViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-29.
//
//

#import "HypTenAPViewController.h"

@interface HypTenAPViewController ()

@end

@implementation HypTenAPViewController

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
    [super viewDidLoad];
	[scrollAPView setScrollEnabled:YES];
	[scrollAPView setContentSize:CGSizeMake(320, 1555)];
    // Do any additional setup after loading the view from its nib.
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
