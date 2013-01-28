//
//  QInMurFinalViewController.h
//  iHarveyMedStu
//
//  Created by Reid Adams on 10-08-04.
//  Copyright 2010 DeVry Healthcare Group Center for Excellence in Simulation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QInMurFinalViewController : UIViewController {
	
	IBOutlet UIPickerView *myPicker;
	NSMutableArray *pickerArray;

	
	
}

@property (nonatomic, retain) IBOutlet UIPickerView *myPicker;



@end
