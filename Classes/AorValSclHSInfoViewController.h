//
//  AorValSclHSInfoViewController.h
//  IHarvey
//
//  Created by Reid Adams on 10-07-25.
//  Copyright 2010 Reid Adams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AorValSclHSInfoViewController : UIViewController {
	
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
