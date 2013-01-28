//
//  IntroHSInfoViewController.h
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
// 

@interface IntroHSInfoViewController : UIViewController {

	IBOutlet UIScrollView *scrollView;
	IBOutlet UIButton *vidplay;
	IBOutlet UIButton *vidp;
	IBOutlet UIButton *vidt;
	IBOutlet UIButton *vidm;
}

-(IBAction)donebuttonpress;
-(IBAction)vidplay;
-(IBAction)pvidp;
-(IBAction)pvidt;
-(IBAction)pvidm;
@end
