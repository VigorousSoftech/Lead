//
//  AppDelegate.h
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HudView.h"
#import "Facebook.h"
#import "FBConnect.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,UITabBarDelegate>{
    HudView *aHUD;
    Facebook *facebook;
}
@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) NSMutableDictionary *dictionaryForImageCacheing;
@property( strong, nonatomic) NSMutableDictionary *dictUserValue;
-(void) killHUD;
-(void) showHUD;

@property (nonatomic, retain) Facebook *facebook;

@end

