//
//  WhatLikeCell.h
//  Lead
//
//  Created by Admin on 25/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//



@protocol WhatLikedelegate
-(void)actionOnCheckUncheck:(int)rowIndex;
@end

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface WhatLikeCell : UITableViewCell{
    NSObject<WhatLikedelegate> *WhatLikedelegate;

}
@property(strong,nonatomic)IBOutlet AsyncImageView *UserImage;
@property(strong,nonatomic)IBOutlet UIButton *btnCheckUncheck;
@property(strong,nonatomic)IBOutlet UILabel *lblUserName;

@property(strong, nonatomic)id<WhatLikedelegate>WhatLikedelegate;

-(IBAction)actionOnCheckUncheck:(id)sender;
@end
