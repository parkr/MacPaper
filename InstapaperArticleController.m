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
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		article = [[InstapaperArticle alloc] init];
		self.posx = xval;
		self.posy = yval;
		[self updateView];
	}
	return self;
}

- (id) initRandomAtX:(int)xval y:(int)yval{
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		article = [[InstapaperArticle alloc] initRandom];
		self.posx = xval;
		self.posy = yval;
		[self updateView];
	}else {
		self = nil;
	}
	return self;
}

- (id) initWithId:(int)this_article_id AtX:(int)xval y:(int)yval{
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		article = [[InstapaperArticle alloc] initWithId:this_article_id];
		self.posx = xval;
		self.posy = yval;
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
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		article =  [[InstapaperArticle alloc] initWithTitle:title description:description linkk:linkk];
		self.posx = xval;
		self.posy = yval;
		[self updateView];
	}
	return self;
}

- (void) dealloc{
	[article dealloc];
	[super dealloc];
}

- (void) awakeFromNib{
	[self updateView];
}

- (void) updateView{
	[titleField setStringValue:[article titlee]];
	[descField setStringValue:[article desc]];
	[linkField setStringValue:[article link]];
	article.frame = NSMakeRect(self.posx, self.posy, VIEW_WIDTH, VIEW_HEIGHT);
	[self setView:article];
	[article display];
}

- (IBAction) update:(id)sender{
	[self updateView];
	NSLog(@"View updated.");
}

- (NSString*) title {
	return [article titlee];
}

- (InstapaperArticle*) getView {
	return article;
}

- (void) moveToX:(int)x Y:(int)y {
	self.posx = x;
	self.posy = y;
	[self updateView];
}

@end
