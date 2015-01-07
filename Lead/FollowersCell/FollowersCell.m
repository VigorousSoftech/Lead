//
//  FollowersCell.m
//  Lead
//
//  Created by Admin on 21/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//
extern int intFollowClick;

#import "FollowersCell.h"

@implementation FollowersCell
@synthesize followerdelegate;
@synthesize lbltime,lblUserName,UserImage,btnFollowFollowng;
- (void)awakeFromNib {
    // Initialization code
    [btnFollowFollowng setFrame:CGRectMake([UIApplication sharedApplication].keyWindow.frame.size.width-btnFollowFollowng.frame.size.width-10, btnFollowFollowng.frame.origin.y, btnFollowFollowng.frame.size.width, btnFollowFollowng.frame.size.height)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(IBAction)actionOnFollowFollowing:(UIButton*)sender;
{
    if ([btnFollowFollowng isSelected]) {
         intFollowClick=0;
        [btnFollowFollowng setSelected:NO];
    }else{
         intFollowClick=1;
        [btnFollowFollowng setSelected:YES];
    }
    
    if ([followerdelegate respondsToSelector:@selector(actionOnFollowrsUserButton:)])
    {
        
        [followerdelegate actionOnFollowrsUserButton:sender.tag];
    }
}
-(IBAction)actionOnUserImage:(UIButton*)sender{
    if ([followerdelegate respondsToSelector:@selector(actionOnFollowrsUserImageButton:)]) {
        [followerdelegate actionOnFollowrsUserImageButton:sender.tag];
    }
}
@end
