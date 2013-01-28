//
//  HypTenLungSoundsViewController.h
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-28.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HypTenLungSoundsViewController : UIViewController {

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
