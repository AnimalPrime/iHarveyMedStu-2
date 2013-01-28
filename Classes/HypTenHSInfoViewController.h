//
//  HypTenHSInfoViewController.h
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-30.
//
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface HypTenHSInfoViewController : UIViewController
{
	
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
