//
//  InstapaperOAuth.m
//  Macpaper
//
//  Created by Parker Moore on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperOAuth.h"


@implementation InstapaperOAuth
@synthesize consumer;

- (id) init{
	if (self = [super init]) {
		self.consumer = [[OAConsumer alloc]initWithKey:OAUTH_CONSUMER_KEY secret:OAUTH_CONSUMER_SECRET];
		return self;
	}else {
		return nil;
	}
}

@end
