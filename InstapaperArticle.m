//
//  InstapaperArticle.m
//  Macpaper
//
//  Created by Parker Moore on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperArticle.h"
#import "InstapaperUtilities.h"

@implementation InstapaperArticle
	@synthesize titlee, desc, link, is_default;

	#pragma mark Constructors

- (id) init{
	if( self = [super init] ){
		[self setTitlee:[[NSString alloc] initWithString:@"This is a title"]];
		[self setDesc:[[NSString alloc] initWithString:@"This is a description"]];
		[self setLink:[[NSString alloc] initWithString:@"http://instapaper.com"]];
	}
	return self;
}

- (id) initRandom{
	if(self = [super init]){
		InstapaperUtilities *util = [[InstapaperUtilities alloc] init];
		[self setTitlee:[util genRandStringLength:10]];
		[self setDesc:[util genRandStringLength:40]];
		[self setLink:[util genRandStringLength:11]];
		[util autorelease];
	}else {
		self = nil;
	}
	return self;
}

- (id) initWithTitle:(NSString*)title description:(NSString*)description linkk:(NSString*)linkk{
	if( self = [super init] ){
		[self setTitlee:title];
		[self setDesc:description];
		[self setLink:linkk];
	}
	return self;
}

- (void)dealloc{
	[titlee release];
	[desc release];
	[link release];
	[super dealloc];
}

#pragma mark Methods

- (BOOL) isDefault{
	return self.is_default;
}

@end
