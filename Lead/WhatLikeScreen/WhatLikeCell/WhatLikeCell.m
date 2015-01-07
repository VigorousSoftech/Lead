//
//  WhatLikeCell.m
//  Lead
//
//  Created by Admin on 25/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

extern int intForTag;

#import "WhatLikeCell.h"

@implementation WhatLikeCell
@synthesize btnCheckUncheck,lblUserName,UserImage;
@synthesize WhatLikedelegate;
- (void)awakeFromNib {
    
    [btnCheckUncheck setFrame:CGRectMake([UIApplication sharedApplication].keyWindow.frame.size.width-(btnCheckUncheck.frame.size.width +20), btnCheckUncheck.frame.origin.y, btnCheckUncheck.frame.size.width, btnCheckUncheck.frame.size.height)];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)actionOnCheckUncheck:(UIButton*)sender;
{
    if ([btnCheckUncheck isSelected]) {
        intForTag=0;
        [btnCheckUncheck setSelected:NO];
    }else{
        intForTag=1;
        [btnCheckUncheck setSelected:YES];
    }
    
    if ([WhatLikedelegate respondsToSelector:@selector(actionOnCheckUncheck:)])
    {
        [WhatLikedelegate actionOnCheckUncheck:sender.tag];
    }
}

@end
