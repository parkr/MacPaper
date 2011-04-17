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

@implementation InstapaperController

- (void) viewDidLoad {
    articles = [[NSMutableArray alloc] init];
	for (int k=0; k<SIZE_OF_SAMPLE_ARRAY; k++){
		[articles addObject:[[InstapaperArticle alloc]initRandom]];
	}
	article_id = 0;
	// I guess this is where I'd get the articles using the API.
	
}

- (IBAction)openUrl:(id)sender {
	/*InstapaperArticle *insta;
	insta = [[InstapaperArticle alloc]initDefault];
	
	[insta setTitlee:[titleField stringValue]];
	[insta setDesc:[descField stringValue]];
	[insta setLink:[linkField stringValue]];*/
	
	NSWorkspace * ws = [NSWorkspace sharedWorkspace];
	NSURL *url = [NSURL URLWithString:[linkField stringValue]];
	[ws openURL: url];
	//[insta release];
}

- (IBAction)setArticle:(id)sender{
	if(articles == nil){
		[self viewDidLoad];
	}
	article_id += 1;
	if (article_id >= [articles count]) {
		// Loop it back to the beginning.
		article_id = 0;
	}
	InstapaperArticle *curr = [articles objectAtIndex:article_id];
	printf("%d\n", article_id);
	[titleField setStringValue:[curr titlee]];
	[descField setStringValue:[curr desc]];
	NSString* linkk = [curr link];
	[linkField setStringValue:linkk];
	[curr release];
}


@end
