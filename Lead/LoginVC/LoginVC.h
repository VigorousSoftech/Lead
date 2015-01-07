//
//  LoginVC.h
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "WebserviceOperation.h"
#import "Facebook.h"
#import "FBConnect.h"

@interface LoginVC : UIViewController<UITextFieldDelegate,FBLoginViewDelegate,FBGraphUser,FBRequestDelegate>{
    AppDelegate *delegate;    
}
@property(strong,nonatomic)IBOutlet UITextField *txtUserName;
@property(strong,nonatomic)IBOutlet UITextField *txtPassword;
@property(strong,nonatomic)IBOutlet UIButton *btnFb;
@property(strong,nonatomic)IBOutlet UIButton *btnForgetPass;
@property(strong,nonatomic)IBOutlet UITextField *txtEmilId;

@property(strong,nonatomic)IBOutlet UIImageView *imgd;
@property(strong,nonatomic)IBOutlet UIImageView *imgBg;

@property(strong, nonatomic) IBOutlet UIView *viewForForget;
@property(strong, nonatomic) IBOutlet UIView *viewForForgetNew;
@property(strong, nonatomic) IBOutlet  UITextField *txtForEmailForget;

-(IBAction)actionOnFbLogin:(id)sender;
-(IBAction)actionOnLogin:(id)sender;
-(IBAction)actionOnForgatePass:(id)sender;

-(IBAction)actionOnCencelButton:(id)sender;
-(IBAction)actionOnOK:(id)sender;


@end
