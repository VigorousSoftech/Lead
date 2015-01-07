//
//  FeedClassVC.h
//  Lead
//
//  Created by Admin on 16/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockActionSheet.h"
#import "BlockAlertView.h"
#import "MyFeedCustomClass.h"
#import "WebserviceOperation.h"
#import "AppDelegate.h"
#import <MediaPlayer/MediaPlayer.h>
#import "BlockActionSheet.h"
#import "RTLabel.h"

@interface FeedClassVC : UIViewController<UITableViewDataSource,UITableViewDelegate,MyFeedCustomCellViewDelegate,UIGestureRecognizerDelegate,BlockActionSheetDelegate,RTLabelDelegate>
{
    UITableView *tableForFeed;
    NSMutableArray *arrayForHotFeed;
    BOOL isSelected;
    UIButton *btnSearch;
    UIButton *btnRefresh;
    AppDelegate *delegate;
    NSMutableArray *arrayForLeadData;
    NSMutableArray *arrayHotLeadData;
    NSMutableArray *arrayForTagUserData;
    int likedComShareIndex;
    UIButton *btnBack;
    MPMoviePlayerController *moviePlayer;
    UITapGestureRecognizer *tapRecognizer;
    UITapGestureRecognizer *tapRecognizerSingleTap;
    int imageIndexPath;
    int indexForHotLead;
    int Videoindexpath;
    
}
    

@property(strong,nonatomic)IBOutlet UIButton *btnLeadFeed;
@property(strong,nonatomic)IBOutlet UIButton *btnHotLead;
@property(strong,nonatomic)NSString *strMediaId;
@property(strong,nonatomic)IBOutlet UITableView *tableForFeed;
@property(strong,nonatomic)IBOutlet UIView *viewForButtn;
@property(strong,nonatomic)IBOutlet UIImageView *imgForHeaderBg;
@property(strong,nonatomic)IBOutlet UILabel *lblLeadtxt ,*lblHottxt;


@property(strong,nonatomic)IBOutlet UIView *popUpView;
@property(strong,nonatomic)IBOutlet UITableView *tableForUserList;
-(IBAction)actionONFeedHeader:(id)sender;

-(IBAction)actionOnLeadFeed:(id)sender;
-(IBAction)actionOnHotFeed:(id)sender;
@end
