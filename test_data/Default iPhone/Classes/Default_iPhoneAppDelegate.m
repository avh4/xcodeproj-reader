//
//  Default_iPhoneAppDelegate.m
//  Default iPhone
//
//  Created by Aaron VonderHaar on 3/28/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Default_iPhoneAppDelegate.h"
#import "RootViewController.h"


@implementation Default_iPhoneAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
