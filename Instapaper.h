//
//  Instapaper.h
//  Macpaper
//
//  Created by Parker Moore on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OAuthConsumer.h"

@class Instapaper;
@interface Instapaper : NSObject {
	NSString *consumerKey, *consumerSecret;
}
@property(readwrite, retain) NSString *consumerKey, *consumerSecret;

- (id) init;

@end
