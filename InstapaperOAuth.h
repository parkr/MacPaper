//
//  InstapaperOAuth.h
//  Macpaper
//
//  Created by Parker Moore on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OAConsumer.h"
#import "OAToken.h"
#define OAUTH_CONSUMER_KEY @"HZNmhafptvaiUlN5fvtuFBo1Lgl6EvU8n6YkwaKyjoeZk6wSVv"
#define OAUTH_CONSUMER_SECRET @"EqhMdZUOLhjb7HJUb3i4RJkMcwcF4kdKtfl81Yb836ypgonFB0"
#define XAUTH_ACCESS_TOKEN_URL @"http://instapaper.com/api/1/oauth/access_token"
#define HTTP_POST_METHOD @"POST"
#define OAUTHTOKEN_PROVIDER @"instapaper"
#define OAUTHTOKEN_PREFIX @"token"

@interface InstapaperOAuth : NSWindowController {
	IBOutlet NSTextField *usernameField, *passwordField;
	OAToken *oauthToken;
	NSString *consumerKey, *consumerSecret;
	bool signed_in;
}
@property(readwrite, retain) OAToken *oauthToken;
@property(readwrite, retain) NSString *consumerKey, *consumerSecret;
@property(readonly) bool signed_in;

- (id) init;
- (void) dealloc;
- (void) signIn;
- (IBAction)authenticate:(id)sender;

@end
