//
//  QHypTenFinalViewController.m
//  iHarveyMedStu
//
//  Created by Reid Adams on 12-08-30.
//
//

#import "QHypTenFinalViewController.h"


@implementation QHypTenFinalViewController
@synthesize myPicker;


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [pickerArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [pickerArray objectAtIndex:row];
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
	if ([[pickerArray objectAtIndex:row] isEqual:@"Intro"]) {
		NSLog(@"1");
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Alert" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
		
		alert.title = @"Diagnosis:";
		alert.message = @"Incorrect";
		[alert show];
		[alert release];
        
	}
	
	else if ([[pickerArray objectAtIndex:row] isEqual:@"Normal"]) {
		NSLog(@"2");
		
        
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Alert" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
		
		alert.title = @"Diagnosis:";
		alert.message = @"Incorrect";
		[alert show];
		[alert release];
		
		
	}
	
	else if ([[pickerArray objectAtIndex:row] isEqual:@"Innocent Murmur"]) {
		NSLog(@"3");
		
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Alert" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
		
		alert.title = @"Diagnosis:";
		alert.message = @"Incorrect";
		[alert show];
		[alert release];
        
    }
	
	else if ([[pickerArray objectAtIndex:row] isEqual:@"Aortic Valve Sclerosis"]) {
		NSLog(@"4");
		
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Alert" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
		
		alert.title = @"Diagnosis:";
		alert.message = @"Incorrect";
		[alert show];
		[alert release];
        
        
    }
	
	else if ([[pickerArray objectAtIndex:row] isEqual:@"Hypertension"]) {
		NSLog(@"5");
        
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Alert" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
		
		alert.title = @"Diagnosis:";
		alert.message = @"Hypertension, Correct";
		[alert show];
		[alert release];
        
		
	}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	pickerArray = [[NSMutableArray alloc] init];
	[pickerArray addObject:@"Intro"];
	[pickerArray addObject:@"Normal"];
	[pickerArray addObject:@"Innocent Murmur"];
	[pickerArray addObject:@"Aortic Valve Sclerosis"];
	[pickerArray addObject:@"Hypertension"];
	
    
	[super viewDidLoad];
}


/*-(IBAction) Butpress {
 if (check = 1) {
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Alert" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
 
 alert.title = @"Diagnosis:";
 alert.message = @"Incorrect";
 [alert show];
 [alert release];
 
 }
 
 else if (check = 2) {
 
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Alert" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
 
 alert.title = @"Diagnosis:";
 alert.message = @"Innocent Murmur, Correct";
 [alert show];
 [alert release];
 }
 
 }
 
 */
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end