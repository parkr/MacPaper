//
//  InstapaperArticleController.m
//  Macpaper
//
//  Created by Parker Moore on 4/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperArticleController.h"


@implementation InstapaperArticleController

- (id) init{
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		article = [[InstapaperArticle alloc] init];
		[self updateView];
	}
	return self;
}

- (id) initRandom{
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		article = [[InstapaperArticle alloc] initRandom];
		[self updateView];
	}else {
		self = nil;
	}
	return self;
}

- (id) initWithId:(int)this_article_id{
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		article = [[InstapaperArticle alloc] initWithId:this_article_id];
		if (article == nil) {
			NSLog(@"You fucked up.");
		}
		[self updateView];
	}else {
		self = nil;
	}
	return self;
}

- (id) initWithTitle:(NSString*)title description:(NSString*)description linkk:(NSString*)linkk{
	if(self = [super initWithNibName:@"Article" bundle:nil]){
		article =  [[InstapaperArticle alloc] initWithTitle:title description:description linkk:linkk];
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

- (InstapaperArticle*) getView{
	return article;
}

@end
