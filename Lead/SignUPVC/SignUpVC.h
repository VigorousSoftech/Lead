//
//  SignUpVC.h
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryPicker.h"
#import "BlockActionSheet.h"
#import "BlockAlertView.h"
#import "AsyncImageView.h"
#import "FindFriendsVC.h"

@interface SignUpVC : UIViewController<UIScrollViewDelegate,CountryPickerDelegate,BlockActionSheetDelegate,BlockAlertViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPickerViewAccessibilityDelegate,UIPickerViewDataSource,UIPickerViewDelegate>{
CountryPicker *countryPicker;
    UIPopoverController *popOverController;
    UIImage *captureImage;
    UIImageView *userimage;
}
@property(strong, nonatomic) NSString *strForFromFB;
@property(strong,nonatomic)IBOutlet  UITextField *txtUserName;
@property(strong,nonatomic)IBOutlet  UITextField *txtPassword;
@property(strong,nonatomic)IBOutlet  UITextField *txtEmail;
@property(strong,nonatomic)IBOutlet  UITextField *txtFirstName;
@property(strong,nonatomic)IBOutlet  UITextField *txtLastName;
@property(strong,nonatomic)IBOutlet  UITextField *txtGEnder;
@property(strong,nonatomic)IBOutlet  UITextField *txtAge;
@property(strong,nonatomic)IBOutlet  UITextField *txtZipCode;
@property(strong, nonatomic) IBOutlet AsyncImageView *btnCamera;
@property(strong, nonatomic)IBOutlet UIScrollView *scorllViewForMainView;
@property(strong,nonatomic)IBOutlet CountryPicker *countryPicker;
@property(strong,nonatomic)IBOutlet UIPickerView *genderPicker;
@property(strong, nonatomic) IBOutlet UIButton *btnCountryCode;
@property(strong, nonatomic) IBOutlet UIView *viewForAccessory;
@property(strong, nonatomic) IBOutlet UIButton *btnForGender;

-(IBAction)actionOnCamera:(id)sender;
-(IBAction)actionOnTapToLogin:(id)sender;
-(IBAction)actionONCountryCode:(id)sender;
-(IBAction)actionOnPickerDone:(id)sender;
-(IBAction)actionOnPickerCancel:(id)sender;
-(IBAction)actionOnAgePickerDone:(id)sender;
-(IBAction)actionOnAgePickerCancel:(id)sender;
-(IBAction)actionOnAge:(id)sender;
-(IBAction)actionOnGender:(id)sender;



@end
