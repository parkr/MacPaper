//
//  MacpaperAppDelegate.m
//  Macpaper
//
//  Created by Parker Moore on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MacpaperAppDelegate.h"
#import "InstapaperController.h"
#import "RedView.h"

@implementation MacpaperAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Gotta finish opening the app.
	InstapaperController *insta = [[InstapaperController alloc] init:window];
	[window setWindowController:insta];
	[insta release];
	[[window contentView] addSubview:[[RedView alloc] initWithFrame:NSMakeRect(10.0, 10.0, 100.0, 20.0)]];
	NSLog(@"%@", [[window contentView] subviews]);
	[window display];
	[[window contentView] display];
	//[window setContentView:[[NSView alloc]init]];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
	return YES;
}

@end
