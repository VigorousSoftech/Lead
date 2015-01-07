//
//  MyFeedCustomClass.h
//  Lead
//
//  Created by Admin on 28/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

@protocol MyFeedCustomCellViewDelegate

-(void)myFeedOnComment:(int)rowIndex;
-(void)myFeedOnLikeButton:(int)rowIndex;
-(void)myFeedOnFaveroiteButton:(int)rowIndex;
-(void)myFeedOnUNFaveroiteButton:(int)rowIndex;
-(void)myFeedOnReLeadButton:(int)rowIndex;
-(void)myFeedOnProfileImage:(int)rowIndex;
-(void)myFeedOnFeedImage:(int)rowIndex;
-(void)myFeedOnViewAllLike:(int)rowIndex;
-(void)myFeedOnViewAllComments:(int)rowIndex;
-(void)myFeedOnLoveButton:(int)rowIndex;
-(void)myFeedOnViewAllLovers:(int)rowIndex;
-(void)myFeedOnPlayVideo:(int)rowIndex;
-(void)myFeedOnPlayVideoNotification:(int)rowIndex;
-(void)myFeedOnStopVideo:(int)rowIndex;
-(void)myFeedOnTaging:(id)sender;

-(void)myFeedOnZoom:(id)sender;

@end


#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
#import "RTLabel.h"

@interface MyFeedCustomClass : UIViewController{
    UIImageView *bg_boxImageView;
    AsyncImageView *asyImageView;
    
    NSObject<MyFeedCustomCellViewDelegate> *MyFeedCustomCellViewDelegate;
}

@property(strong, nonatomic) IBOutlet UIView *viewForMainBG;
@property(strong, nonatomic) IBOutlet UILabel *lblForFeeder;
@property(nonatomic, strong)IBOutlet UIImageView *bg_boxImageView;
@property(nonatomic, strong)IBOutlet AsyncImageView *asyImageView;
@property(nonatomic, strong)IBOutlet AsyncImageView *profileImage;
@property(strong,nonatomic)RTLabel *lblUsername;
@property(strong,nonatomic)IBOutlet UILabel *lblTime;
@property(strong,nonatomic)IBOutlet UILabel *lblLikeCounts;
@property(strong,nonatomic)RTLabel *lblAllLikeUser;
@property(strong,nonatomic)IBOutlet UILabel *lblCommentsCounts;
@property(strong,nonatomic)IBOutlet UILabel *lblLoveCount;
@property(strong,nonatomic)RTLabel *lblLoversNames;
@property(strong,nonatomic)IBOutlet UILabel *lblFavoriteCount;
@property(strong,nonatomic)IBOutlet UILabel *lblReleadCount;
@property(strong,nonatomic)IBOutlet UIView *viewForVideo;
@property(strong,nonatomic) RTLabel *makeRTLabel;
@property(strong,nonatomic)IBOutlet UIButton *btnViewAllLovers;
@property (strong, nonatomic) IBOutlet UIView *ViewForDoubleTap;
@property(strong,nonatomic)IBOutlet UIButton *vidbutton;

@property(strong,nonatomic)IBOutlet UIView *viewAlpha;

@property(strong,nonatomic)IBOutlet UIButton *btnLike;
@property(strong,nonatomic)IBOutlet UIButton *btnComment;
@property(strong,nonatomic)IBOutlet UIButton *btnAllLike;
@property(strong,nonatomic)IBOutlet UIButton *btnFav;
@property(strong,nonatomic)IBOutlet UIButton *btnUnFav;
@property(strong,nonatomic)IBOutlet UIButton *btnRelead;
@property(strong,nonatomic)IBOutlet UIButton *btnAllComments;
@property(strong,nonatomic)IBOutlet UIButton *btnLove;

@property(strong,nonatomic)IBOutlet UILabel *lblViews;
@property(strong,nonatomic)IBOutlet UIButton *btnVideoPlay;
@property(strong,nonatomic)IBOutlet UIButton *btnStopVideo;
@property(strong,nonatomic)IBOutlet UIButton *btnTag;
@property (strong, nonatomic) IBOutlet UIView *ViewForRTLabel;
@property(strong,nonatomic)IBOutlet UILabel *lblCaption;

@property(strong, nonatomic) id<MyFeedCustomCellViewDelegate> delegate;

-(IBAction)actionOnProfileImage:(UIButton *)sender;
-(IBAction)actionOnFeedImage:(UIButton*)sender;
-(IBAction)actionOnReLead:(UIButton*)sender;
-(IBAction)actionOnFavroite:(UIButton*)sender;
-(IBAction)actionOnUnFavroite:(UIButton*)sender;
-(IBAction)actionOnViewLike:(UIButton*)sender;
-(IBAction)actionOnViewComment:(UIButton*)sender;
-(IBAction)actionOnLikeButton:(UIButton*)sender;
-(IBAction)actionOnCommentButton:(id)sender;
-(IBAction)actionOnLove:(id)sender;
-(IBAction)actionOnVeiwLovers:(id)sender;
-(IBAction)actionOnVideoButton:(id)sender;
-(IBAction)actionOnStopVideo:(id)sender;
-(IBAction)actionOnTaging:(id)sender;


@end
