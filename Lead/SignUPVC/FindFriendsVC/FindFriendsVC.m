//
//  FindFriendsVC.m
//  Lead
//
//  Created by Admin on 21/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//
#define isiPhone (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone)

#import "FindFriendsVC.h"
#import "AsyncImageView.h"
#import "SuggesstedUserVC.h"
#import "AppDelegate.h"
#import "WhatLikeVC.h"
#import "BlockAlertView.h"

@interface FindFriendsVC (){
    AppDelegate *delegate;
}

@end

@implementation FindFriendsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    delegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-------------------------------------------------------------
#pragma mark - UITableView Delegates
//-------------------------------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    if (section==0)
    {
        return 1;
    }else{
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0)
    {
        if (isiPhone)
        {
            
            return 45.0;
        }else
        {
            return 100;
        }
    }else
    {
        if (isiPhone)
        {
            
            return 45.0;
        }else
        {
            return 200;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    UIImageView *imgArrow;
    if (isiPhone) {
        
        imgArrow =[[UIImageView alloc]initWithFrame:CGRectMake([UIApplication sharedApplication].keyWindow.frame.size.width-30, 16, 9, 12) ];
    }else {
        imgArrow =[[UIImageView alloc]initWithFrame:CGRectMake([UIApplication sharedApplication].keyWindow.frame.size.width-30, 50, 9, 12) ];
        
    }
    imgArrow.image=[UIImage imageNamed:@"Arrow_News.png"];
    
    UIImageView *imgSocial;
    if (isiPhone)
    {
        
        imgSocial =[[UIImageView alloc]initWithFrame:CGRectMake(16, 15, 20, 20)];
    }else
    {
        imgSocial =[[UIImageView alloc]initWithFrame:CGRectMake(50, 64, 30, 30)];
    }
    
   // imgSocial.image=[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.row]];
    if (indexPath.section==1)
    {
        if (isiPhone)
        {
            
            imgSocial.frame=CGRectMake(16, 18,20, 20);
        } else
        {
            imgSocial =[[UIImageView alloc]initWithFrame:CGRectMake(50, 75, 30, 30)];
            
        }
        imgSocial.image=[UIImage imageNamed:@"suggested_user.png"];
    }
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId] ;
        cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text_fild.png"]];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (indexPath.section==0)
        {
            if (isiPhone)
            {
                
               // cell.textLabel.text=[arrayOfOption objectAtIndex:indexPath.row];
                cell.textLabel.font=[UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0];
                cell.textLabel.backgroundColor=[UIColor clearColor];
            }else
            {
                
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 15, 300, 70)];
               // label.text=[arrayOfOption objectAtIndex:indexPath.row];
                label.font=[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
                label.backgroundColor=[UIColor clearColor];
                [cell addSubview:label];
                
            }
            imgSocial.image=[UIImage imageNamed:@"suggested_user.png"];
            cell.detailTextLabel.backgroundColor=[UIColor clearColor];
            [cell addSubview:imgArrow];
            [cell addSubview:imgSocial];
        }else
        {
            UIView *viewFor;
            if (isiPhone)
            {
                
                viewFor =[[UIView alloc]initWithFrame:CGRectMake(10, 0, 300,50) ];
            }else
            {
                [imgArrow setFrame:CGRectMake(375, 95, 9, 12)];
                viewFor =[[UIView alloc]initWithFrame:CGRectMake(10, 45, 758,160) ];
                
            }
            viewFor.backgroundColor=[UIColor clearColor];
            [cell addSubview:viewFor];
            [cell addSubview:imgSocial];
            AsyncImageView *imgUser;
            if (isiPhone)
            {
                
                imgUser=[[AsyncImageView alloc]initWithFrame:CGRectMake(35, 60, 30, 30)];
            }else
            {
                imgUser=[[AsyncImageView alloc]initWithFrame:CGRectMake(90, 90, 50, 50)];
                
            }
            [imgUser setBackgroundColor:[UIColor blackColor]];
           // [imgUser setBackgroundImage:_imageProfile forState:UIControlStateNormal];
            if (isiPhone)
            {
                
                // [viewFor addSubview:imgUser];
            }
            
            UILabel  *lbl1;
            
            lbl1.backgroundColor=[UIColor clearColor];
            if (isiPhone) {
                
                lbl1=[[UILabel alloc]initWithFrame:CGRectMake(31, 10, 150, 30) ];
                lbl1.font=[UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0];
                lbl1.text=@"Suggested Users";
                [viewFor addSubview:lbl1];
            }else {
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(90, 15, 300, 70)];
                label.text=@"Suggested Users";
                label.font=[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
                label.backgroundColor=[UIColor clearColor];
                [viewFor addSubview:label];
                
            }
            UILabel  *lbl2;
            lbl2=[[UILabel alloc]initWithFrame:CGRectMake(35, 23, 240, 40) ];
            lbl2.backgroundColor=[UIColor clearColor];
            lbl2.textColor=[UIColor lightGrayColor];
            //            lbl2.text=@"You're following yard sale closets we think you'll like.";
            lbl2.font=[UIFont fontWithName:@"HelveticaNeue" size:10.0];
            [viewFor addSubview:lbl2];
            [cell addSubview:imgArrow];
            [cell addSubview:imgSocial];
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebserviceOperation *service=[[WebserviceOperation alloc]initWithDelegate:self callback:@selector(SuggesstedUserHandler:)];
    [delegate showHUD];
    [service GetSuggesstedUser:[delegate.dictUserValue valueForKey:@"userid"]];
}

#pragma mark WebServiceHandler
-(void)SuggesstedUserHandler:(id)sender{
    [delegate killHUD];
    if([sender isKindOfClass:[NSError class]]) {
        
        BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Message" message:@"Error from server please try again later."];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        
            }else{
        NSError *error=nil;
        NSString *str=[sender stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
        //NSLog(@"value of data %@",str);
        id strForResponce = [NSJSONSerialization JSONObjectWithData: [str dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: &error];
        if (error==nil) {
            NSMutableArray *arTemp=(NSMutableArray*)strForResponce;
              SuggesstedUserVC *objSuggess = [self.storyboard instantiateViewControllerWithIdentifier:@"SuggestedUser"];
              objSuggess.arrForSuggesstedUser=arTemp;
              [self.navigationController pushViewController:objSuggess animated:YES];

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
