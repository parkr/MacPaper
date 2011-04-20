//
//  InstapaperArticleController.h
//  Macpaper
//
//  Created by Parker Moore on 4/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "InstapaperArticle.h"
#define VIEW_HEIGHT 118
#define VIEW_WIDTH 525

@interface InstapaperArticleController : NSViewController {
	IBOutlet NSTextField *titleField;
	IBOutlet NSTextField *descField;
	IBOutlet NSTextField *linkField;
	IBOutlet InstapaperArticle *article;
	int posx, posy;
}
@property(readwrite) int posx, posy;

- (id) initAtX:(int)xval y:(int)yval;
- (id) initRandomAtX:(int)xval y:(int)yval;
- (id) initWithId:(int)this_article_id AtX:(int)xval y:(int)yval;
- (id) initWithTitle:(NSString*)title description:(NSString*)description linkk:(NSString*)linkk AtX:(int)xval y:(int)yval;
- (void) dealloc;

- (void) updateView;
- (IBAction) update:(id)sender;
- (NSString*) title;
- (InstapaperArticle*) getView;
- (void) moveToX:(int)x Y:(int)y;

@end
