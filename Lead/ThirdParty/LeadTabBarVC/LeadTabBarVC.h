//
//  LeadTabBarVC.h
//  Lead
//
//  Created by Admin on 20/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LeadTabBarVC : UITabBarController<UITabBarControllerDelegate>{
    AppDelegate *delegate;
}
/*TabBar*/
@property(strong, nonatomic)   UITabBarController *tabcontroller;


@property(strong,nonatomic)UIButton * leadTabButton;
@property(strong,nonatomic)UIButton * historyTabButton;
@property(strong,nonatomic)UIButton * postTabButton;
@property(strong,nonatomic)UIButton * profileTabButton;
@property(strong,nonatomic)UIButton * moreTabButton;

@property(strong,nonatomic)UIView * viewTabBarBg;
@property(strong,nonatomic)UIImageView *imageViewTabBarBg;

-(void)addCustomTabBar;

@end
