//
//  InMurHSInfoViewController.h
//  IHarvey
//
//  Created by Reid Adams on 10-07-23.
//  Copyright 2010 RUSM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>


@interface InMurHSInfoViewController : UIViewController {
	
	IBOutlet UIScrollView *scrollView;
	IBOutlet UIButton *vidplay;
	IBOutlet UIButton *vidp;
	IBOutlet UIButton *vidt;
	IBOutlet UIButton *vidm;
	
 AVAudioPlayer *audioPlayer; 
}

-(IBAction)donebuttonpress;
-(IBAction)vidplay;
-(IBAction)pvidp;
-(IBAction)pvidt;
-(IBAction)pvidm;

@end
