//
//  WebserviceOperation.h

//
//  Created by Praveen Tripathi on 26/12/10.
//  Copyright 2010 PKTSVITS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface WebserviceOperation : NSObject<NSURLConnectionDelegate> {
	NSMutableData *responseData;
    NSURLConnection *connection;
	id _delegate;
	SEL _callback;
}

@property(nonatomic, retain) 	id _delegate;
@property(nonatomic, assign) 	SEL _callback;

-(id)initWithDelegate:(id)delegate callback:(SEL)callback;


//************************

-(void)SaveUser:(NSString*)firstname lastname:(NSString*)lastname emailid:(NSString*)emailid password:(NSString*)password username:(NSString*)username fbid:(NSString*)fbid gender:(NSString*)gender age:(NSString*)age country:(NSString*)country whatlike:(NSString*)whatlike deviceid:(NSString*)deviceid lastlogin:(NSString*)lastlogin profile:(NSString*)profile profile_picture_url:(NSString*)profile_picture_url;

-(void)LoginUser:(NSString*)emailid password:(NSString*)password fbid:(NSString*)fbid;

-(void)GetSuggesstedUser:(NSString*)userid;

-(void)GetSuggesstedLike:(NSString*)userid;

-(void)SetUserLike:(NSString*)userid likeArr:(NSString*)likeStr;
-(void)SetFollowUnFollow:(NSString*)userid frienduserid:(NSString*)frienduserid isactive:(NSString*)isactive;

@end
