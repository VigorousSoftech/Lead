//
//  FollowersCell.h
//  Lead
//
//  Created by Admin on 21/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//


@protocol followerdelegate
-(void)actionOnFollowrsUserImageButton:(int)rowIndex;
-(void)actionOnFollowrsUserButton:(int)rowIndex;
@end

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface FollowersCell : UITableViewCell{
    NSObject<followerdelegate> *followerdelegate;
}
@property(strong,nonatomic)IBOutlet AsyncImageView *UserImage;
@property(strong,nonatomic)IBOutlet UIButton *btnFollowFollowng;
@property(strong,nonatomic)IBOutlet UILabel *lblUserName;
@property(strong,nonatomic)IBOutlet UILabel *lbltime;

@property(strong, nonatomic)id<followerdelegate>followerdelegate;

-(IBAction)actionOnFollowFollowing:(id)sender;
-(IBAction)actionOnUserImage:(id)sender;

@end
