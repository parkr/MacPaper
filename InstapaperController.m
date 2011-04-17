//
//  InstapaperController.m
//  Macpaper
//
//  Created by Parker Moore on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperController.h"
#import "Instapaper.h"

@implementation InstapaperController

- (IBAction)openUrl:(id)sender {
	Instapaper *insta;
	insta = [[Instapaper alloc]init];
	
	[insta setTitlee:[titleField stringValue]];
	[insta setDesc:[descField stringValue]];
	[insta setLink:[linkField stringValue]];
	
	NSWorkspace * ws = [NSWorkspace sharedWorkspace];
	NSURL *url = [ NSURL URLWithString:[insta link] ];
	[ws openURL: url];
}

@end
