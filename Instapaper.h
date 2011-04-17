//
//  Instapaper.h
//  Macpaper
//
//  Created by Parker Moore on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Instapaper : NSObject {
	NSString *titlee, *desc, *link;
}

@property(readwrite) NSString *titlee, *desc, *link;

@end
