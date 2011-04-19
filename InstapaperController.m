//
//  InstapaperController.m
//  Macpaper
//
//  Created by Parker Moore on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperController.h"
#import "InstapaperOAuth.h"
#import "InstapaperArticleController.h"
#define NUMBER_OF_ARTICLES 10

NSMutableArray *articles;
InstapaperOAuth *oauthWindow;
int article_id;

@implementation InstapaperController

- (void) initArticles:(NSWindow *)window{
	self.window = window;
	articles = [[NSMutableArray alloc] initWithCapacity:NUMBER_OF_ARTICLES];
	for (int k=0; k<NUMBER_OF_ARTICLES; k++){
		[articles insertObject:[[InstapaperArticleController alloc]initWithId:k+1] atIndex:k];
		[[window contentView] addSubview:[[articles objectAtIndex:k] getView]];
		NSLog(@"Content view: %@", [window contentView]);
	}
	for (id name in articles)
		NSLog(@"Array element: %@", [name title]);
	article_id = 0;
}

- (id) init:(NSWindow *)window {
	if (self = [super initWithWindow:window]) {
		// I guess this is where I'd get the articles using the API.
		//oauthWindow = [[InstapaperOAuth alloc]init];
		//[oauthWindow signIn];
		[self initArticles:window];
		return self;
	}else {
		return nil;
	}

}

- (void) dealloc {
	[oauthWindow dealloc];
	[articles dealloc];
	[super dealloc];
}

- (void) awakeFromNib {
	if (articles == nil) {
		//[self initArticles];
	}
}

@end
