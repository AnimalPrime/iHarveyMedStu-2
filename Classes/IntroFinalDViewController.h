//
//  IntroFinalDViewController.h
//  IHarvey
//
//  Created by Reid Adams on 10-07-29.
//  Copyright 2010 Ross University School of Medicine. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IntroFinalDViewController : UIViewController {
	UIPickerView *myPicker;
	NSMutableArray *pickerArray;
	
}

@property (nonatomic, retain) IBOutlet UIPickerView *myPicker;



@end
