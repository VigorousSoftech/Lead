//
//  PostDetailVC.h
//  Lead
//
//  Created by Admin on 02/01/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BlockAlertView.h"
#import "BlockActionSheet.h"

@interface PostDetailVC : UIViewController<BlockAlertViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UITextViewDelegate>{
    UIButton *imgFirst;
   // ImagePickerControllerClassLookshots *object;
    NSMutableArray *arrayForImages;
    //WebService *service;
    NSString *noOfImages;
    NSArray *arrayForRating;
    AppDelegate *delegate;
    NSUInteger strLength;
    NSMutableArray *arrayForNames;
    NSString *strForTagData;

}
@property(nonatomic,strong)IBOutlet UIScrollView *scrollViewForBg,*scrollForBtn;
@property(strong,nonatomic)IBOutlet UIButton *imgFirst;
@property(nonatomic,strong)IBOutlet UIButton *btnAddPhoto1,*btnAddPhoto2,*btnAddPhoto3;
@property(strong,nonatomic)IBOutlet UITextField *txtDescribe;
@property(strong,nonatomic)IBOutlet UITextField *txtActualPrice;
@property(strong,nonatomic)IBOutlet UITextField *txtListingPrice;
@property(strong,nonatomic)IBOutlet UITextField *txtRating;
@property(strong,nonatomic)IBOutlet UITextField *txtKeywords;
@property(strong,nonatomic)IBOutlet UIView *viewForSwitch;
@property(strong,nonatomic)IBOutlet UIView *viewForSwitch2;
@property(strong,nonatomic)NSString *strVideo;
@property(strong,nonatomic)IBOutlet UITextView *txtTagUsers;

@property(strong,nonatomic)IBOutlet UIView *popUpView;
@property(strong,nonatomic)NSData *dataForVideo;
@property(strong,nonatomic)NSURL *videoPostURL;
@property(nonatomic,strong)NSMutableDictionary *dictOfImages;
@property(strong,nonatomic)IBOutlet UIButton *btnChecked;

@property(strong,nonatomic)IBOutlet UIView *viewFoorTable;
@property(strong,nonatomic)IBOutlet UITableView *tableForRating;
@property(strong,nonatomic)IBOutlet UITableView *tableForTagUser;
@property(strong,nonatomic)IBOutlet UIImageView *imgBG;

-(IBAction)btnAddPhotoHanler:(id)sender;
-(IBAction)btnFirstHanler:(UIButton *)sender;
-(IBAction)actionOnRating:(id)sender;
-(IBAction)checked:(id)sender;
-(IBAction)actionOnTagingOn:(id)sender;
@end
