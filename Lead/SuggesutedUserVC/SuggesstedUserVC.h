//
//  SuggesstedUserVC.h
//  Lead
//
//  Created by Admin on 21/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FollowersCell.h"
#import "WebserviceOperation.h"

@interface SuggesstedUserVC : UIViewController<followerdelegate>{
    AppDelegate *appDelegate;
//    WebService *service;
    NSMutableArray *arrayForSuggestedUserList;
    NSMutableDictionary *dictUserCheck;
    int currentIndex;

}
@property (strong, nonatomic) IBOutlet UITableView *tableUsers;
@property(strong,nonatomic)NSMutableDictionary *ductForSignupData;
@property(strong,nonatomic)IBOutlet UIImageView *imgBg;
@property(strong, nonatomic) NSMutableArray *arrForSuggesstedUser;
@property(strong,nonatomic)IBOutlet UILabel *lblMsg;
@end
