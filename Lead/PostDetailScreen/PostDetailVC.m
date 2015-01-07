//
//  PostDetailVC.m
//  Lead
//
//  Created by Admin on 02/01/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "PostDetailVC.h"

@interface PostDetailVC (){
    UIToolbar * keyboardToolBar ;
}

@end
UIButton *btnBack;
UIButton *btnDone;
BOOL nextButtonFlag;
BOOL isFirstMedia;
UIImage *imgCenter;
BOOL isDelete;
int indexOfImage;
BOOL changeImage;
BOOL isEditMedia;
BOOL isFromEdit;
BOOL checked;
int event=0;
int selling=0;
int mediaPrivate=0;
UIImage  *thumbnail;

@implementation PostDetailVC

@synthesize scrollViewForBg,scrollForBtn;
@synthesize imgFirst;
@synthesize btnAddPhoto1,btnAddPhoto2,btnAddPhoto3;
@synthesize txtActualPrice,txtDescribe,txtListingPrice,txtKeywords,txtRating;
@synthesize dictOfImages;
@synthesize viewForSwitch,viewForSwitch2;
@synthesize btnChecked;
@synthesize viewFoorTable;
@synthesize dataForVideo;
@synthesize videoPostURL;
@synthesize strVideo,txtTagUsers,popUpView;
@synthesize imgBG;



UIImage *sharePhoto;
BOOL isConfigureDoneButtonClicked,isCrossButtonClicked,isFromFirstButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
