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
	// Need to have that content scroll. (used IB to create scroll view inside window. Put content inside this window.)
	NSArray *wSubviews = [[window contentView]subviews];
	[window setContentView:[wSubviews objectAtIndex:0]];
	// Gotta finish opening the app.
	[window setWindowController:[[InstapaperController alloc] init:window]];
	// What do we have?
	NSLog(@"%@", [[window contentView] subviews]);
	[window makeKeyAndOrderFront:self];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
	return YES;
}

- (IBAction)openPreferencePanel:(id)sender {
    
    NSImage *img = [NSImage imageNamed:@"Macpaper"];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
							 @"0.1", @"Version",
							 @"Macpaper", @"ApplicationName",
							 img, @"ApplicationIcon",
							 @"Copyright 2011, Parker Moore", @"Copyright",
							 @"Macpaper v0.1", @"ApplicationVersion",
							 nil];
    [[NSApplication sharedApplication] orderFrontStandardAboutPanelWithOptions:options];
}

@end
