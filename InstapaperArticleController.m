//
//  InstapaperArticleController.m
//  Macpaper
//
//  Created by Parker Moore on 4/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperArticleController.h"


@implementation InstapaperArticleController
@synthesize posx, posy;

- (id) initAtX:(int)xval y:(int)yval{
	// Initializes the view controller by opening up the nib file, 
	//		creating an article (NSView) for the view controller,
	//		and give the view controller some X and Y coordinates.
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		self.posx = xval;
		self.posy = yval;
		article = [[InstapaperArticle alloc] initWithFrame:NSMakeRect(self.posx, self.posy, VIEW_WIDTH, VIEW_HEIGHT)];
		[self updateView];
	}
	return self;
}

- (id) initRandomAtX:(int)xval y:(int)yval{
	// Initializes the view controller by opening up the nib file, 
	//		creating an article (NSView) for the view controller,
	//		and give the view controller some X and Y coordinates.
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		self.posx = xval;
		self.posy = yval;
		article = [[InstapaperArticle alloc] initRandomWithFrame:NSMakeRect(self.posx, self.posy, VIEW_WIDTH, VIEW_HEIGHT)];
		[self updateView];
	}else {
		self = nil;
	}
	return self;
}

- (id) initWithId:(int)this_article_id AtX:(int)xval y:(int)yval{
	// Initializes the view controller by opening up the nib file, 
	//		creating an article (NSView) for the view controller,
	//		and give the view controller some X and Y coordinates.
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		self.posx = xval;
		self.posy = yval;
		article = [[InstapaperArticle alloc] initWithId:this_article_id frame:NSMakeRect(self.posx, self.posy, VIEW_WIDTH, VIEW_HEIGHT)];
		if (article == nil) {
			NSLog(@"You fucked up.");
		}
		[self updateView];
	}else {
		self = nil;
	}
	return self;
}

- (id) initWithTitle:(NSString*)title description:(NSString*)description linkk:(NSString*)linkk AtX:(int)xval y:(int)yval{
	// Initializes the view controller by opening up the nib file, 
	//		creating an article (NSView) for the view controller,
	//		and give the view controller some X and Y coordinates.
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		self.posx = xval;
		self.posy = yval;
		article =  [[InstapaperArticle alloc] initWithTitle:title description:description linkk:linkk frame:NSMakeRect(self.posx, self.posy, VIEW_WIDTH, VIEW_HEIGHT)];
		[self updateView];
	}
	return self;
}

- (void) dealloc{
	// Throw it away.
	[titleField release];
	[descField release];
	[linkField release];
	[article dealloc];
	[super dealloc];
}

- (void) awakeFromNib{
	// Awake? Update me.
	[self updateView];
}

- (void) updateView{
	// Sets the values of the NSTextFields, sets the frame and displays the article.
	[titleField setStringValue:[article titlee]];
	[descField setStringValue:[article desc]];
	[linkField setStringValue:[article link]];
	[self setView:article];
	[article display];
}

- (IBAction) update:(id)sender{
	// Update. Used by an outlet for debugging.
	[self updateView];
	NSLog(@"View updated.");
}

- (NSString*) title {
	// Returns the title of the article.
	return [article titlee];
}

- (InstapaperArticle*) getView {
	// Returns the NSView housed in this NSViewController.
	return article;
}

- (void) moveToX:(int)x Y:(int)y {
	// Sets the X and Y values to those that were inputted and updates the display.
	self.posx = x;
	self.posy = y;
	[self updateView];
}

@end
