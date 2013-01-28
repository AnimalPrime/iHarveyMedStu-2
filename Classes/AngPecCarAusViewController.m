//
//  AngPecCarAusViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-31.
//
//

#import "AngPecCarAusViewController.h"

@interface AngPecCarAusViewController ()

@end

@implementation AngPecCarAusViewController

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
