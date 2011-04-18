//
//  InstapaperController.m
//  Macpaper
//
//  Created by Parker Moore on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperController.h"
#define SIZE_OF_SAMPLE_ARRAY 10

NSMutableArray *articles;
int article_id;
InstapaperOAuth *oauthWindow;

@implementation InstapaperController

- (void) initArticles{
	articles = [[NSMutableArray alloc] init];
	for (int k=0; k<SIZE_OF_SAMPLE_ARRAY; k++){
		[articles addObject:[[InstapaperArticle alloc]initWithId:k+1]];
	}
	article_id = 0;
}

- (void) setArticle{
	InstapaperArticle *curr = [articles objectAtIndex:article_id];
	[titleField setStringValue:[curr titlee]];
	[descField setStringValue:[curr desc]];
	[linkField setStringValue:[curr link]];
	NSLog(@"Article Set: %d", article_id);
	[curr release];
}

- (id) init {
	if (self = [super init]) {
		// I guess this is where I'd get the articles using the API.
		oauthWindow = [[InstapaperOAuth alloc]init];
		[oauthWindow signIn];
		[self initArticles];
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
	[self setArticle];
}

- (IBAction)openUrl:(id)sender {
	NSWorkspace * ws = [NSWorkspace sharedWorkspace];
	NSURL *url = [NSURL URLWithString:[linkField stringValue]];
	[ws openURL: url];
	[ws release];
}

- (IBAction)nextArticle:(id)sender{
	article_id += 1;
	if (article_id >= [articles count]) {
		// Loop it back to the beginning.
		article_id = 0;
	}
	[self setArticle];
}

- (IBAction)previousArticle:(id)sender{
	article_id -= 1;
	if (article_id < 0) {
		// Loop it back to the beginning.
		article_id = [articles count]-1;
	}
	[self setArticle];
}

@end
