//
//  iHarveyMedStuAppDelegate.h
//  iHarveyMedStu
//
//  Created by Reid Adams on 10-08-03.
//  Copyright DeVry Healthcare Group Center for Excellence in Simulation 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestFlight.h"
#import "AppboySession.h"

@interface iHarveyMedStuAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

