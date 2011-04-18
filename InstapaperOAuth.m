//
//  InstapaperOAuth.m
//  Macpaper
//
//  Created by Parker Moore on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstapaperOAuth.h"
#import "OAToken.h"
#import "OAMutableURLRequest.h"


@implementation InstapaperOAuth
@synthesize signed_in, oauthToken, consumerKey, consumerSecret;

- (id) init{
	if (self = [super initWithWindowNibName:@"Authenticate"]) {
		//self.consumer = [[OAConsumer alloc]initWithKey:OAUTH_CONSUMER_KEY secret:OAUTH_CONSUMER_SECRET];
		self.consumerKey = OAUTH_CONSUMER_KEY;
		self.consumerSecret = OAUTH_CONSUMER_SECRET;
		return self;
	}else {
		return nil;
	}
}

- (void) dealloc {
	[super dealloc];
}

- (void) signIn{
	// Open up the window.
	[passwordField setSecureTextEntry:YES];
	[self loadWindow];
}

- (void)requestXAuthAccessTokenForUsername:(NSString *)username 
								  password:(NSString *)password
{
	//clear old token
	self.oauthToken = nil;
	
	OAConsumer *consumer = [[[OAConsumer alloc] initWithKey:self.consumerKey secret:self.consumerSecret] autorelease];
	
	//setup oauth request
	OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:[NSURL URLWithString:XAUTH_ACCESS_TOKEN_URL]
																   consumer:consumer
																	  token:nil		// xAuth needs no request token
																	  realm:nil		// our service provider doesn't specify a realm
														  signatureProvider:nil];	// use the default method, HMAC-SHA1
	
	[request setHTTPMethod:HTTP_POST_METHOD];
	
	[request setParameters:[NSArray arrayWithObjects:
							[OARequestParameter requestParameter:@"x_auth_mode" value:@"client_auth"],
							[OARequestParameter requestParameter:@"x_auth_username" value:username],
							[OARequestParameter requestParameter:@"x_auth_password" value:password],
							nil]];	
	
	
	// alway prepare the OA request
	[request prepare];
	
	//execute request
	NSHTTPURLResponse *response;
	NSError *error;
	NSData *respData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
	//receive oauth token
	if(respData != nil && response != NULL && [response statusCode] >= 200 && [response statusCode] < 300)
	{
		NSLog(@"Instapaper: received oAuth Token for %@", username);
		
		//get response data
		NSString *text = [[NSString alloc] initWithData:respData encoding:NSUTF8StringEncoding];
		NSLog(@"Instapaper: received %@", text);
		
		//parse token
		OAToken *token = [[OAToken alloc] initWithHTTPResponseBody:text];
		[text release];
		
		if([token isValid]) 
		{
			//store token within user defaults
			self.oauthToken = token;
			[oauthToken storeInUserDefaultsWithServiceProviderName:OAUTHTOKEN_PROVIDER prefix:OAUTHTOKEN_PREFIX];
		}
		else
			NSLog(@"Instapaper: oAuth Token is not valid!");
		
		[token release];
	}
	else
	{
		NSLog(@"Instapaper: could not receive a valid oAuth Token for %@", username);
	}
}

- (IBAction)authenticate:(id)sender {
	NSString *username, *password;
	username = [usernameField stringValue];
	NSLog(@"%@", username);
	password = [passwordField stringValue];
	NSLog(@"%@", password);
	[self requestXAuthAccessTokenForUsername:username password:password];
	NSLog(@"Did it work?!");
	[self close];
}

@end
