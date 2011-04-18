//
//  InstapaperArticle.h
//  Macpaper
//
//  Created by Parker Moore on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface InstapaperArticle : NSObject {
	NSString *titlee, *desc, *link;
	BOOL is_default;
}
@property(readwrite, retain) NSString *titlee, *desc, *link;
@property(readonly) BOOL is_default;

#pragma mark Constructors

- (id) initRandom;
- (id) initWithId:(int)this_article_id;
- (id) initWithTitle:(NSString*)title description:(NSString*)description linkk:(NSString*)linkk;
- (void) dealloc;

#pragma mark Methods

- (BOOL) isDefault;

@end
