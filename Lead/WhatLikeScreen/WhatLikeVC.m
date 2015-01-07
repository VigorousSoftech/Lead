//
//  WhatLikeVC.m
//  Lead
//
//  Created by Admin on 25/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

int intForTag;

#import "WhatLikeVC.h"
#import "WhatLikeCell.h"
#import "AsyncImageView.h"
#import "WebserviceOperation.h"
#import "BlockAlertView.h"
#import "FindFriendsVC.h"

@interface WhatLikeVC ()
{
    AppDelegate *delegate;
    NSString *strForWhatsLike;
    NSMutableArray *itemsTemp;
    NSMutableDictionary *dictTemp;
}
@end

@implementation WhatLikeVC
@synthesize tblForWhatLike,arrForWhatLike;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (arrForWhatLike==nil) {
        arrForWhatLike=[[NSMutableArray alloc]init];
    }
    if (itemsTemp==nil) {
        itemsTemp=[[NSMutableArray alloc]init];
    }
    if (dictTemp==nil) {
        dictTemp=[[NSMutableDictionary alloc]init];
    }
    delegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    WebserviceOperation *service=[[WebserviceOperation alloc]initWithDelegate:self callback:@selector(SuggesstedLikeHandler:)];
    [delegate showHUD];
    [service GetSuggesstedLike:[delegate.dictUserValue valueForKey:@"userid"]];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark IBActionMethod
-(IBAction)actionONDone:(id)sender{
    if (itemsTemp.count==0) {
        BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Message" message:@"Please at least check one like."];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        return;
    }
    
        NSString * result = [[itemsTemp valueForKey:@"description"] componentsJoinedByString:@","];
        
        
    NSLog(@"result==>%@",result);
   // result = [[itemsTemp objectAtIndex:<#(NSUInteger)#>] componentsJoinedByString:@""];
    
    WebserviceOperation *service=[[WebserviceOperation alloc]initWithDelegate:self callback:@selector(SetUserLikeHandler:)];
     [delegate showHUD];
    [service SetUserLike:[delegate.dictUserValue valueForKey:@"userid"] likeArr:result];
}



-(void)SetUserLikeHandler:(id)sender{
    [delegate killHUD];
    if([sender isKindOfClass:[NSError class]]) {
        BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Error" message:@"Error from server please try again later."];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
    }else{
        NSError *error=nil;
        NSString *str=[sender stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
        //NSLog(@"value of data %@",str);
        id strForResponce = [NSJSONSerialization JSONObjectWithData: [str dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: &error];
        
        if (error==nil) {
            
            [delegate killHUD];
            //NSLog(@"value of %@",[[strForResponce  class] description]);
            //NSLog(@"value of %@",[(NSDictionary*)strForResponce  valueForKey:@"email"]);
            
            if ([strForResponce count]>0) {
                NSLog(@"value of %lu",(unsigned long)[strForResponce count]);
                if ([strForResponce count]==1) {
                    NSString *str=[[(NSDictionary*)strForResponce  valueForKey:@"email"] objectAtIndex:0];
                    NSLog(@"value of str %@",str);
                        NSArray *dic=(NSArray*)strForResponce;
                        
                    if ([[dic valueForKey:@"message"] isEqualToString:@"successfully liked"]) {
                        FindFriendsVC *objFind=[self.storyboard instantiateViewControllerWithIdentifier:@"FindFriends"];
                        [self.navigationController pushViewController:objFind animated:YES];
                    }
                    
                                        
                }else{
                    
                    
                }
                
            }else{
                BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Error" message:@"Error from server please try again later."];
                [alert setDestructiveButtonWithTitle:@"OK" block:nil];
                [alert show];
                return;
            }
            
            
        }else{
            BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Error" message:@"Error from server please try again later."];
            [alert setDestructiveButtonWithTitle:@"OK" block:nil];
            [alert show];
            return;
        }
        
    }
}





#pragma Mark TableView Delegates......

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrForWhatLike.count;    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WhatLikeCell";
    
    WhatLikeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.lblUserName.text=[[arrForWhatLike objectAtIndex:indexPath.row] valueForKey:@"name"];
    [cell.UserImage loadImage:[[arrForWhatLike objectAtIndex:indexPath.row] valueForKey:@"likeimage"]];
    [cell.btnCheckUncheck setTag:indexPath.row];
    cell.WhatLikedelegate=self;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)actionOnCheckUncheck:(int)rowIndex{
    
  // NSString *tempStr=[NSString stringWithFormat:@"%@",[[[arrForWhatLike objectAtIndex:rowIndex] valueForKey:@"whatlikeid"] stringValue]];
    
    if (intForTag==0) {
        [itemsTemp removeObjectAtIndex:rowIndex];
    }else{
        //Click
        [itemsTemp addObject:[[arrForWhatLike objectAtIndex:rowIndex] valueForKey:@"whatlikeid"]];
    }
    
    NSLog(@"itemsTemp==>%@",itemsTemp);
    
    
   // [items addObject:tempStr];
    
    
   // NSArray *items = [tempStr componentsSeparatedByString:@","];
    
}


#pragma mark WebServiceHandler
-(void)SuggesstedLikeHandler:(id)sender{
    [delegate killHUD];
    if([sender isKindOfClass:[NSError class]]) {
        UIAlertView *errorAlert = [[UIAlertView alloc]
                                   initWithTitle: @"Error"
                                   message: @"Error from server please try again later."
                                   delegate:nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
        [errorAlert show];
    }else{
        NSError *error=nil;
        NSString *str=[sender stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
        //NSLog(@"value of data %@",str);
        id strForResponce = [NSJSONSerialization JSONObjectWithData: [str dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: &error];
          NSArray *arTemp=(NSArray*)strForResponce;
        if (arTemp.count==0) {
            BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Message" message:@"Server error!"];
            [alert setDestructiveButtonWithTitle:@"Ok" block:nil];
            [alert show];
            return;
        }
        if (error==nil) {
            [arrForWhatLike addObjectsFromArray:arTemp];
            [tblForWhatLike reloadData];
            
        }
    }
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
