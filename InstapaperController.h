//
//  InstapaperController.h
//  Macpaper
//
//  Created by Parker Moore on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OAuthConsumer.h"
#import "InstapaperArticle.h"

@interface InstapaperController : NSObject {
	IBOutlet NSTextFieldCell *titleField;
	IBOutlet NSTextFieldCell *descField;
	IBOutlet NSTextField *linkField;
}

- (void) viewDidLoad;

- (IBAction)openUrl:(id)sender;
- (IBAction)setArticle:(id)sender;

@end
