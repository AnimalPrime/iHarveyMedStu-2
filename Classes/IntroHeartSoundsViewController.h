//
//  IntroHeartSoundsViewController.h
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "IntroHSInfoViewController.h"


@interface IntroHeartSoundsViewController : UIViewController {
	IBOutlet UIButton *aBut;
	IBOutlet UIButton *pBut;
	IBOutlet UIButton *mBut;
	IBOutlet UIButton *tBut;
	IBOutlet UIButton *info;
	
	
	AVAudioPlayer *audioPlayer; 
}

-(IBAction)playa;
-(IBAction)stopa;
-(IBAction)playp;
-(IBAction)stopp;
-(IBAction)playm;
-(IBAction)stopm;
-(IBAction)playt;
-(IBAction)stopt;
-(IBAction)flipinfo;
@end
