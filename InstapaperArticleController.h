//
//  InstapaperArticleController.h
//  Macpaper
//
//  Created by Parker Moore on 4/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "InstapaperArticle.h"

@interface InstapaperArticleController : NSViewController {
	IBOutlet NSTextField *titleField;
	IBOutlet NSTextField *descField;
	IBOutlet NSTextField *linkField;
	IBOutlet InstapaperArticle *article;
}

- (id) initRandom;
- (id) initWithId:(int)this_article_id;
- (id) initWithTitle:(NSString*)title description:(NSString*)description linkk:(NSString*)linkk;
- (void) dealloc;

- (void) updateView;
- (IBAction) update:(id)sender;
- (NSString*) title;
- (InstapaperArticle*) getView;

@end
