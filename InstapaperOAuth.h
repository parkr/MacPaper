//
//  InstapaperOAuth.h
//  Macpaper
//
//  Created by Parker Moore on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OAConsumer.h"
#define OAUTH_CONSUMER_KEY @"HZNmhafptvaiUlN5fvtuFBo1Lgl6EvU8n6YkwaKyjoeZk6wSVv"
#define OAUTH_CONSUMER_SECRET @"EqhMdZUOLhjb7HJUb3i4RJkMcwcF4kdKtfl81Yb836ypgonFB0"

@interface InstapaperOAuth : NSObject {
	OAConsumer *consumer;
}
@property(readwrite, retain) OAConsumer *consumer;

- (id) init;

@end
