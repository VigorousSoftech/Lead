//
//  WhatLikeVC.h
//  Lead
//
//  Created by Admin on 25/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhatLikeCell.h"

@interface WhatLikeVC : UIViewController<UITableViewDataSource, UITableViewDelegate,WhatLikedelegate>
{
    
}

@property(strong, nonatomic) IBOutlet UITableView *tblForWhatLike;
@property(strong, nonatomic) NSMutableArray *arrForWhatLike;
-(IBAction)actionONDone:(id)sender;
@end
