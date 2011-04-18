//
//  InstapaperUtilities.m
//  Macpaper
//
//  Created by Parker Moore on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperUtilities.h"

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

@implementation InstapaperUtilities

-(NSString *) genRandStringWithLength: (int) len {
	
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
	
    for (int i=0; i<len; i++) {
		[randomString appendFormat:@"%c", [letters characterAtIndex: rand()%[letters length]]];
	}
	return randomString;
}

@end
