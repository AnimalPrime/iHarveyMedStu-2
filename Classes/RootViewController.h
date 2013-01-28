//
//  RootViewController.h
//  iHarveyMedStu
//
//  Created by Reid Adams on 10-08-03.
//  Copyright DeVry Healthcare Group Center for Excellence in Simulation 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppboySession.h"
#import "iHarveyMedStuAppDelegate.h"
 
@interface RootViewController : UITableViewController  <AppboySessionDelegate> {
	
		NSMutableArray *menuList;
}

@property (nonatomic, retain) NSMutableArray *menuList;

@end
