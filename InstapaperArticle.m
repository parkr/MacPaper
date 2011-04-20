//
//  InstapaperArticle.m
//  Macpaper
//
//  Created by Parker Moore on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperArticle.h"
#import "InstapaperUtilities.h"

@implementation InstapaperArticle
	@synthesize titlee, desc, link, is_default;

	#pragma mark Constructors

- (id) initWithFrame:(NSRect)frameRect{
	if(self = [super initWithFrame:frameRect]){
		// Initialize it with a generic string.
		[self setTitlee:[[NSString alloc] initWithString:@"This is a title"]];
		[self setDesc:[[NSString alloc] initWithString:@"This is a description"]];
		[self setLink:[[NSString alloc] initWithString:@"http://instapaper.com"]];
	}
	return self;
}

- (id) initRandomWithFrame:(NSRect)frameRect{
	if(self = [super initWithFrame:frameRect]){
		// Initialize it with a random string.
		InstapaperUtilities *util = [[InstapaperUtilities alloc] init];
		[self setTitlee:[util genRandStringWithLength:10]];
		[self setDesc:[util genRandStringWithLength:40]];
		[self setLink:[util genRandStringWithLength:11]];
		[util autorelease];
	}else {
		self = nil;
	}
	return self;
}

- (id) initWithId:(int)this_article_id frame:(NSRect)frameRect{
	if(self = [super initWithFrame:frameRect]){
		// Initialize it with a more specific string.
		[self setTitlee:[NSString stringWithFormat:@"Article %d", this_article_id]];
		[self setDesc:[NSString stringWithFormat:@"Description %d", this_article_id]];
		[self setLink:[NSString stringWithFormat:@"http://xkcd.com/%d", this_article_id]];
	}else {
		self = nil;
	}
	return self;
}

- (id) initWithTitle:(NSString*)title description:(NSString*)description linkk:(NSString*)linkk frame:(NSRect)frameRect{
	if(self = [super initWithFrame:frameRect]){
		// Initialize it with what was inputted.
		[self setTitlee:title];
		[self setDesc:description];
		[self setLink:linkk];
	}
	return self;
}

- (void) dealloc{
	// Throw it away.
	[titlee release];
	[desc release];
	[link release];
	[super dealloc];
}

#pragma mark Methods

- (BOOL) isDefault{
	return self.is_default;
}

#pragma mark View

- (IBAction)openUrl:(id)sender {
	// Open the URL of that particular article.
	NSWorkspace * ws = [NSWorkspace sharedWorkspace];
	//NSURL *url = [NSURL URLWithString:[linkField stringValue]];
	NSURL *url = [NSURL URLWithString:link];
	[ws openURL: url];
	[ws release];
}

- (void)drawRect:(NSRect)dirtyRect {
	// Show the view.
	[[NSColor redColor] set]; // Sets current drawing color.
	//NSRectFill(self.bounds); // Defines a rectangle and then fills it with the current drawing color.
	[[NSColor colorWithCalibratedRed:0.7 green:0.9 blue:0.3 alpha:1.0] set]; // Sets a new color.
	[[NSBezierPath bezierPathWithOvalInRect:NSMakeRect(5, 0, 10, 10)] fill]; // Draws a circle in the new color.
}

@end
