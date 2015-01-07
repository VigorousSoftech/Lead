//
//  LeadTabBarVC.m
//  Lead
//
//  Created by Admin on 20/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#define isiPhone5 ([UIScreen mainScreen].bounds.size.height==568)
#define isiPhone (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone)

#import "LeadTabBarVC.h"
#import "FeedClassVC.h"
#import "HistoryScreen.h"
#import "PostScreen.h"
#import "ProfileScreen.h"
#import "MoreScreen.h"
#import "Constant.h"

@interface LeadTabBarVC ()

@end

@implementation LeadTabBarVC
//***Tab***//
@synthesize leadTabButton;
@synthesize historyTabButton;
@synthesize postTabButton;
@synthesize profileTabButton;
@synthesize moreTabButton;
@synthesize viewTabBarBg;
@synthesize imageViewTabBarBg;
@synthesize tabcontroller;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self addCustomTabBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addCustomTabBar
{
    
    tabcontroller=[[UITabBarController alloc]init];
    
    FeedClassVC *ObjFeed=[[FeedClassVC alloc]init];
    HistoryScreen *ObjHistory=[[HistoryScreen alloc]init];
    PostScreen *ObjPost=[[PostScreen alloc]init];
    ProfileScreen *ObjProfile=[[ProfileScreen alloc]init];
    MoreScreen *ObjMore=[[MoreScreen alloc]init];
    
    // load the storyboard by name
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // either one of the two, depending on if your view controller is the initial one
    ObjFeed = [storyboard instantiateInitialViewController];
    ObjFeed = [storyboard instantiateViewControllerWithIdentifier:@"FeedClass"];
    ObjHistory = [storyboard instantiateViewControllerWithIdentifier:@"HistoryClass"];
     ObjPost = [storyboard instantiateViewControllerWithIdentifier:@"PostClass"];
     ObjProfile = [storyboard instantiateViewControllerWithIdentifier:@"ProfileClass"];
     ObjMore = [storyboard instantiateViewControllerWithIdentifier:@"MoreClass"];
    
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:ObjFeed];
    [tabViewControllers addObject:ObjHistory];
    [tabViewControllers addObject:ObjPost];
    [tabViewControllers addObject:ObjProfile];
    [tabViewControllers addObject:ObjMore];
    [self setViewControllers:tabViewControllers];
    //can't set this until after its added to the tab bar
    
    if (viewTabBarBg!=nil)
    {
        viewTabBarBg=nil;
    }
    if (isiPhone)
    {
        viewTabBarBg=[[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIApplication sharedApplication].keyWindow.frame.size.width, 49)];
    }
    else
    {
        viewTabBarBg=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 55)];
    }
    if (imageViewTabBarBg!=nil)
    {
        imageViewTabBarBg=nil;
    }
    [viewTabBarBg setBackgroundColor:[UIColor colorWithRed:26/255.0 green:26/255.0 blue:27/255.0 alpha:1.0]];
    
    leadTabButton=[[UIButton alloc]init];
    int widthOfTab =[UIApplication sharedApplication].keyWindow.frame.size.width/5;
    
    
    if (isiPhone)
    {
        [leadTabButton setFrame:CGRectMake(0, 1, widthOfTab, 48)];
//        [leadTabButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", (IS_IPHONE_6_PLUS_HEIGHT ? @"btn_radio_checked@3x.png" : @"tab_lead_inactive.png")]] forState:UIControlStateNormal];

        
        [leadTabButton setBackgroundImage:[UIImage imageNamed:@"tab_lead_inactive.png"] forState:UIControlStateNormal];
        [leadTabButton setBackgroundImage:[UIImage imageNamed:@"tab_lead_active.png"] forState:UIControlStateSelected];
    }else
    {
        [leadTabButton setFrame:CGRectMake(0, 1, widthOfTab, 48)];
        [leadTabButton setBackgroundImage:[UIImage imageNamed:@"tab_lead_inactive.png"] forState:UIControlStateNormal];
        [leadTabButton setBackgroundImage:[UIImage imageNamed:@"tab_lead_active.png"] forState:UIControlStateSelected];
    }
    
    leadTabButton.backgroundColor=[UIColor redColor];
    [leadTabButton addTarget:self action:@selector(actionOnTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
    leadTabButton.tag=0;
    [viewTabBarBg addSubview:leadTabButton];
    historyTabButton=[[UIButton alloc]init];
    
    if (isiPhone) {
        [historyTabButton setFrame:CGRectMake(widthOfTab,1,widthOfTab, 48)];
        [historyTabButton setBackgroundImage:[UIImage imageNamed:@"tab_history_inactive.png"] forState:UIControlStateNormal];
        [historyTabButton setBackgroundImage:[UIImage imageNamed:@"tab_history_active.png"] forState:UIControlStateSelected];
    }else{
        [historyTabButton setFrame:CGRectMake(widthOfTab, 1, widthOfTab, 48)];
        [historyTabButton setBackgroundImage:[UIImage imageNamed:@"tab_history_inactive.png"] forState:UIControlStateNormal];
        [historyTabButton setBackgroundImage:[UIImage imageNamed:@"tab_history_active.png"] forState:UIControlStateSelected];
        
    }
    [historyTabButton addTarget:self action:@selector(actionOnTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
    historyTabButton.tag=1;
    [viewTabBarBg addSubview:historyTabButton];
    postTabButton=[[UIButton alloc]init];
    if (isiPhone)
    {
        [postTabButton setFrame:CGRectMake(2*widthOfTab, 1, widthOfTab, 48)];
        [postTabButton setBackgroundImage:[UIImage imageNamed:@"tab_post_inactive.png"] forState:UIControlStateNormal];
        [postTabButton setBackgroundImage:[UIImage imageNamed:@"tab_post_active.png"] forState:UIControlStateSelected];
    }else{
        [postTabButton setFrame:CGRectMake(widthOfTab*2, 1, widthOfTab, 48)];
        [postTabButton setBackgroundImage:[UIImage imageNamed:@"tab_post_inactive.png"] forState:UIControlStateNormal];
        [postTabButton setBackgroundImage:[UIImage imageNamed:@"tab_post_active.png"] forState:UIControlStateSelected];
    }
    [postTabButton addTarget:self action:@selector(actionOnTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
    postTabButton.tag=2;
    [viewTabBarBg addSubview:postTabButton];
    profileTabButton=[[UIButton alloc]init];
    
    if (isiPhone) {
        
        [profileTabButton setFrame:CGRectMake(3*widthOfTab, 1, widthOfTab, 48)];
        [profileTabButton setBackgroundImage:[UIImage imageNamed:@"tab_profile_inactive.png"] forState:UIControlStateNormal];
        [profileTabButton setBackgroundImage:[UIImage imageNamed:@"tab_profile_active.png"] forState:UIControlStateSelected];
    }else{
        [profileTabButton setFrame:CGRectMake(3*widthOfTab, 1, widthOfTab, 48)];
        [profileTabButton setBackgroundImage:[UIImage imageNamed:@"tab_profile_inactive.png"] forState:UIControlStateNormal];
        [profileTabButton setBackgroundImage:[UIImage imageNamed:@"tab_profile_active.png"] forState:UIControlStateSelected];
    }
    
    
    [profileTabButton addTarget:self action:@selector(actionOnTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
    profileTabButton.tag=3;
    [viewTabBarBg addSubview:profileTabButton];
    
    
    moreTabButton=[[UIButton alloc]init];
    
    if (isiPhone) {
        
        [moreTabButton setFrame:CGRectMake(4*widthOfTab, 1, widthOfTab, 48)];
        [moreTabButton setBackgroundImage:[UIImage imageNamed:@"tab_more_inactive.png"] forState:UIControlStateNormal];
        [moreTabButton setBackgroundImage:[UIImage imageNamed:@"tab_more_active.png"] forState:UIControlStateSelected];
    }else{
        [moreTabButton setFrame:CGRectMake(4*widthOfTab, 1, widthOfTab, 48)];
        [moreTabButton setBackgroundImage:[UIImage imageNamed:@"tab_more_inactive.png"] forState:UIControlStateNormal];
        [moreTabButton setBackgroundImage:[UIImage imageNamed:@"tab_more_active.png"] forState:UIControlStateSelected];
    }
    
    
    [moreTabButton addTarget:self action:@selector(actionOnTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
    moreTabButton.tag=4;
    [viewTabBarBg addSubview:moreTabButton];
    //tabcontroller.selectedIndex=0;
    leadTabButton.selected=YES;
    [self.tabcontroller.tabBar addSubview:viewTabBarBg];
    [self.tabcontroller.tabBar.layer setMasksToBounds:YES];
    
    
    tabcontroller.viewControllers = tabViewControllers;
    tabcontroller.selectedIndex=0;
    tabcontroller.delegate = self;
    

    
    [self.view addSubview:self.tabcontroller.view];
}
-(void)actionOnTabBarButton:(UIButton*)button
{
    
    
    switch (button.tag)
    {
        case 0:
        {
            leadTabButton.selected=YES;
            historyTabButton.selected=NO;;
            postTabButton.selected=NO;
            profileTabButton.selected=NO;
            moreTabButton.selected=NO;
            tabcontroller.selectedIndex=0;
            //currentTab=@"firstTab";
        }
            break;
        case 1:
        {
            leadTabButton.selected=NO;
            historyTabButton.selected=YES;
            postTabButton.selected=NO;
            profileTabButton.selected=NO;
            moreTabButton.selected=NO;
            tabcontroller.selectedIndex=1;
        }
            break;
            
        case 2:
        {
            leadTabButton.selected=NO;
            historyTabButton.selected=NO;
            postTabButton.selected=YES;
            profileTabButton.selected=NO;
            moreTabButton.selected=NO;
            tabcontroller.selectedIndex=2;
        }
            break;
            
        case 3:
        {
            leadTabButton.selected=NO;
            historyTabButton.selected=NO;;
            postTabButton.selected=NO;
            profileTabButton.selected=YES;
            moreTabButton.selected=NO;
            tabcontroller.selectedIndex=3;
        }
            break;
        case 4:
        {
            leadTabButton.selected=NO;
            historyTabButton.selected=NO;;
            postTabButton.selected=NO;
            profileTabButton.selected=NO;
            moreTabButton.selected=YES;
            tabcontroller.selectedIndex=4;
            //currentTab=@"lastTab";
        }
            break;
        default:
            break;
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
