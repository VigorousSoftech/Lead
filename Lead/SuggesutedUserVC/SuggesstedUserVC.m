//
//  SuggesstedUserVC.m
//  Lead
//
//  Created by Admin on 21/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

int intFollowClick;

#import "SuggesstedUserVC.h"
#import "LeadTabBarVC.h"
#import "BlockAlertView.h"

@interface SuggesstedUserVC (){
    AppDelegate *delegate;
    int indexPathFolUN;
}

@end
bool checked;
bool isFollwed;
bool isSelectedFollow;
UIButton *btnBack;
UIButton *btnDone;
UILabel *label;

@implementation SuggesstedUserVC
@synthesize ductForSignupData;
@synthesize tableUsers;
@synthesize imgBg;
@synthesize lblMsg;
@synthesize arrForSuggesstedUser;

- (void)viewDidLoad {
    indexPathFolUN=-1;
    [super viewDidLoad];
    if (arrForSuggesstedUser==nil) {
        arrForSuggesstedUser=[[NSMutableArray alloc]init];
    }
    delegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark IBAction Method

-(IBAction)actionONDoneBtn:(id)sender{
    LeadTabBarVC *objLogin = [self.storyboard instantiateViewControllerWithIdentifier:@"LeadTabBar"];
    [self.navigationController pushViewController:objLogin animated:YES];
}

-(void)actionOnFollowrsUserButton:(int)rowIndex
{
    indexPathFolUN=rowIndex;
    WebserviceOperation *service=[[WebserviceOperation alloc]initWithDelegate:self callback:@selector(actionOnFollowrsUserHandler:)];
    [delegate showHUD];
    [service SetFollowUnFollow:[delegate.dictUserValue objectForKey:@"userid"] frienduserid:[[arrForSuggesstedUser objectAtIndex:rowIndex] valueForKey:@"userid"] isactive:[NSString stringWithFormat:@"%d",intFollowClick]];
}





#pragma Mark TableView Delegates......

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return arrForSuggesstedUser.count;    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SuggestedCell";
    FollowersCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.lblUserName.text =[NSString stringWithFormat:@"%@%@",[[arrForSuggesstedUser objectAtIndex:indexPath.row] valueForKey:@"firstname"],[[arrForSuggesstedUser objectAtIndex:indexPath.row] valueForKey:@"lastname"]];
    [cell.UserImage loadImage:[[arrForSuggesstedUser objectAtIndex:indexPath.row] valueForKey:@"picture"]];
    [cell.btnFollowFollowng setTag:indexPath.row];
    cell.lbltime.text = @"10:00 AM";
    cell.followerdelegate=self;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark WebServiceHandler
-(void)actionOnFollowrsUserHandler:(id)sender{
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
            if ([strForResponce isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dict=(NSDictionary*)strForResponce;
                
                if ([[dict valueForKey:@"message"] isEqualToString:@"Successfully"]) {
                    
                }else{
                    
                }
            }
            
            
//            NSMutableArray *arTemp=(NSMutableArray*)strForResponce;
            
        }
    }
}


@end
