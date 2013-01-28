//
//  NormalHSInfoViewController.h
//  IHarvey
//
//  Created by Reid Adams on 10-07-20.
//  Copyright 2010 RUSM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
 

@interface NormalHSInfoViewController : UIViewController {
	
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
