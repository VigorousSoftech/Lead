
//  WebserviceOperation.m

//  Created by Praveen Tripathi on 26/12/10.
//  Copyright 2010 PKTSVITS. All rights reserved.
//

#import "WebserviceOperation.h"
#import "Constant.h"

//#import "JSON/JSON.h"


@implementation WebserviceOperation
@synthesize	_delegate;
@synthesize _callback;

//-(void)dealloc{
//	[_delegate release];
//	[super dealloc];
//}

-(id)initWithDelegate:(id)delegate callback:(SEL)callback{
	if (self = [super init]) {
		self._delegate = delegate;
		self._callback = callback;
          responseData = [[NSMutableData alloc] init] ;	
	}
	return self;
}


-(void)SaveUser:(NSString*)firstname lastname:(NSString*)lastname emailid:(NSString*)emailid password:(NSString*)password username:(NSString*)username fbid:(NSString*)fbid gender:(NSString*)gender age:(NSString*)age country:(NSString*)country whatlike:(NSString*)whatlike deviceid:(NSString*)deviceid lastlogin:(NSString*)lastlogin profile:(NSString *)profile profile_picture_url:(NSString *)profile_picture_url{
    
    NSString *post = [NSString stringWithFormat:@"user[firstname]=%@&user[lastname]=%@&user[emailid]=%@&user[password]=%@&user[username]=%@&user[fbid]=%@&user[gender]=%@&user[age]=%@&user[country]=%@&user[whatlike]=%@&user[deviceid]=%@&user[lastlogin]=%@&user[profile]=%@&user[profile_picture_url]=%@",firstname,lastname,emailid,password,username,fbid,gender,age,country,whatlike,deviceid,lastlogin,profile,profile_picture_url];

    NSLog(@"Request==>%@",post);
    
    
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSLog(@"post data size %lu",(unsigned long)[postData length]);
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",SERVERBASEURL,@"user/create.json"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}
-(void)LoginUser:(NSString*)emailid password:(NSString*)password fbid:(NSString *)fbid
{
    NSString *post = [NSString stringWithFormat:@"user[emailid]=%@&user[password]=%@&user[fbid]=%@",emailid,password,fbid];
    
    NSLog(@"Request==>%@",post);
    //    NSString *post = [NSString stringWithFormat:@"user[first_name]=%@&user[last_name]=%@&user[email]=%@&user[password]=%@&profile_picture=%@&cover_photo=%@",FirstName,lastName,email,password,profile,cover];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSLog(@"post data size %lu",(unsigned long)[postData length]);
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *str=[NSString stringWithFormat:@"%@%@",SERVERBASEURL,@"login/create.json"];
    NSLog(@"str==>%@",str);
    [request setURL:[NSURL URLWithString:str]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}
-(void)GetSuggesstedUser:(NSString *)userid{
    
    NSString *post = [NSString stringWithFormat:@"user[userid]=%@",userid];
    NSLog(@"post==>%@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSLog(@"post data size %lu",(unsigned long)[postData length]);
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *url=[NSString stringWithFormat:@"%@%@",SERVERBASEURL,@"admin/all_user.json"];
    http://enigmatic-stream-7448.herokuapp.com/admin/all_user.json
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)GetSuggesstedLike:(NSString*)userid{
    
    NSString *post = @"";
    NSLog(@"post==>%@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSLog(@"post data size %lu",(unsigned long)[postData length]);
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSString *url=[NSString stringWithFormat:@"%@%@",SERVERBASEURL,@"admin/all_likes.json"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)SetUserLike:(NSString*)userid likeArr:(NSString*)likeStr{
    
    NSString *post = [NSString stringWithFormat:@"user[userid]=%@&whatlikeid=%@",userid,likeStr];
    
    NSLog(@"Request==>%@",post);
    
    
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSLog(@"post data size %lu",(unsigned long)[postData length]);
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",SERVERBASEURL,@"userlikes/create.json"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}


-(void)SetFollowUnFollow:(NSString*)userid frienduserid:(NSString*)frienduserid isactive:(NSString*)isactive{
    NSString *post = [NSString stringWithFormat:@"relationship[userid]=%@&relationship[frienduserid]=%@&relationship[isactive]=%@",userid,frienduserid,isactive];
    NSLog(@"Request==>%@",post);
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSLog(@"post data size %lu",(unsigned long)[postData length]);
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",SERVERBASEURL,@"relationship/create.json"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if ([self._delegate respondsToSelector:self._callback]) {
        [self._delegate performSelector:self._callback withObject:error];
    }else {
        NSLog(@"Callback is not responding.");
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //[connection release];
    
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    //[responseData release];
    //
    NSError *error;
    //	SBJSON *json = [SBJSON new] ;
    //	NSDictionary *loginResponse = [json objectWithString:responseString error:&error];
    ////	[responseString release];
    
    //NSString *responseString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
    NSString *string = [responseString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\"{" withString:@"{"];
    string = [string stringByReplacingOccurrencesOfString:@"}\"" withString:@"}"];
    string = [string stringByReplacingOccurrencesOfString:@"\"[" withString:@"["];
    string = [string stringByReplacingOccurrencesOfString:@"]\"" withString:@"]"];
    // NSDictionary *responseDict = (NSDictionary *)[string JSONValue];
    //NSLog(@"response=**********%@",string);
    
    
    if (string == nil){
        if ([self._delegate respondsToSelector:self._callback]) {
            [self._delegate performSelector:self._callback withObject:error];
        }
    }
    else{
        if([self._delegate respondsToSelector:self._callback]) {
            [self._delegate performSelector:self._callback withObject:responseString];
        }else{
            NSLog(@"Callback is not responding.");
        }
    }
}


@end
