//
//  AppDelegate.m
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//


//
//  AppDelegate.m
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//


extern int intForFBCall;

#import "AppDelegate.h"
static NSString* kAppId = @"864984853553467";

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize dictionaryForImageCacheing;
@synthesize dictUserValue,facebook;

- (void) killHUD
{
    if(aHUD != nil ){
        [aHUD.loadingView removeFromSuperview];
        [[UIApplication sharedApplication].keyWindow setUserInteractionEnabled:YES];
        aHUD = nil;
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}

//Initialize and display the progress view
- (void) showHUD
{
    if(aHUD == nil)
    {
        aHUD = [[HudView alloc]init];
        [aHUD loadingViewInView:[UIApplication sharedApplication].keyWindow text:@"Please Wait..."];
        [aHUD setUserInteractionEnabledForSuperview:[UIApplication sharedApplication].keyWindow];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [self.facebook handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    [self performSelector:@selector(callNoti) withObject:nil afterDelay:0.5];
    NSArray *arr=[url.absoluteString componentsSeparatedByString:@"access_token="];
    if (arr.count>0) {
       NSArray *arr1=[[arr objectAtIndex:1]componentsSeparatedByString:@"&expires_in="];
        [[NSUserDefaults standardUserDefaults] setValue:[arr1 objectAtIndex:0] forKey:@"FBAccessToken"];
        [NSUserDefaults standardUserDefaults];
    }
   
    
    return [self.facebook handleOpenURL:url];
}
-(void)callNoti{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
    if (intForFBCall==0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"FBLogin" object:self userInfo:nil];
    }
    
}

+(AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (dictionaryForImageCacheing==nil)
    {
        dictionaryForImageCacheing=[[NSMutableDictionary alloc] init];
    }
    // Initialize Facebook
   facebook = [[Facebook alloc] initWithAppId:kAppId andDelegate:nil];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"FaceBookData"];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"FirstFB"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
