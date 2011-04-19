//
//  MacpaperAppDelegate.m
//  Macpaper
//
//  Created by Parker Moore on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MacpaperAppDelegate.h"
#import "InstapaperController.h"

@implementation MacpaperAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Gotta finish opening the app.
	InstapaperController *insta = [[InstapaperController alloc] init:window];
	[window setWindowController:insta];
	[insta release];
	NSLog(@"%@", [[window contentView] subviews]);
	[window makeKeyAndOrderFront:self];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
	return YES;
}

@end
