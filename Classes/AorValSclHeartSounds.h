//
//  AorValSclHeartSounds.h
//  IHarvey
//
//  Created by Reid Adams on 10-07-25.
//  Copyright 2010 RUSM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "InMurHSInfoViewController.h"



@interface AorValSclHeartSounds : UIViewController {

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
