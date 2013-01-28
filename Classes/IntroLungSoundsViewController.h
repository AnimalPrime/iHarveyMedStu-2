//
//  IntroLungSoundsViewController.h
//  IHarvey
//
//  Created by Reid Adams on 6/6/10.
//  Copyright 2010 RUSM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface IntroLungSoundsViewController : UIViewController {
	IBOutlet UIButton *roneBut;
	IBOutlet UIButton *loneBut;
	IBOutlet UIButton *rtwoBut;
	IBOutlet UIButton *ltwoBut;
	IBOutlet UIButton *rthreeBut;
	IBOutlet UIButton *lthreeBut;
	IBOutlet UIButton *info;
	
	AVAudioPlayer *audioPlayer;
}

-(IBAction)playr1;
-(IBAction)stopr1;
-(IBAction)playl1;
-(IBAction)stopl1;
-(IBAction)playr2;
-(IBAction)stopr2;
-(IBAction)playl2;
-(IBAction)stopl2;
-(IBAction)playr3;
-(IBAction)stopr3;
-(IBAction)playl3;
-(IBAction)stopl3;

-(IBAction)flipinfo;

@end
