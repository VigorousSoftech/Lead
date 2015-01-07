//
//  FeedClassVC.m
//  Lead
//
//  Created by Admin on 16/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "FeedClassVC.h"
#import "MyFeedCustomClass.h"

@interface FeedClassVC (){
    NSMutableArray *arrForleadFeed;
}

@end

@implementation FeedClassVC

@synthesize btnHotLead,btnLeadFeed;
@synthesize tableForFeed;
@synthesize viewForButtn;
@synthesize strMediaId;
@synthesize lblHottxt,lblLeadtxt;
@synthesize popUpView,tableForUserList;
@synthesize imgForHeaderBg;
MyFeedCustomClass *customcellSubview;

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    NSMutableDictionary   *dictForImages1=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://images2.fanpop.com/images/photos/8400000/Party-In-The-U-S-A-Music-Video-Stills-HQ-3-miley-cyrus-8433692-1883-2560.jpg",@"Images",@"Music",@"FeedName",@"David Matthews",@"UserName",@"http://cdn.24.co.za/files/Cms/General/d/2465/a7b45e9646844232b15ee9cd785391c1.jpg",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages2=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"https://wallwidehd.com/wp-content/uploads/Sabotage-2014-Movie-Poster-Wallpaper-2560x1600.jpg",@"Images",@"Movies",@"FeedName",@"Kanye",@"UserName",@"http://www.independent.ie/incoming/article30384684.ece/BINARY/Life-Kim-Kardashian.jpg",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages3=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://www.rideoffame.com/wp-content/uploads/sites/8/2014/06/usa-scarves.jpg",@"Images",@"People",@"FeedName",@"Leonardo DiCaprio",@"UserName",@"http://upload.wikimedia.org/wikipedia/commons/8/8f/LeonardoDiCaprioNov08.jpg",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages4=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://www.wallpaperup.com/uploads/wallpapers/2013/07/16/119359/63c33f292f37c58ebad08f787d5f7f50.jpg",@"Images",@"Photography",@"FeedName", @"Bill Murray",@"UserName",@"http://upload.wikimedia.org/wikipedia/commons/8/8f/LeonardoDiCaprioNov08.jpg",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages5=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://www.wallpaperup.com/uploads/wallpapers/2013/07/16/119359/63c33f292f37c58ebad08f787d5f7f50.jpg",@"Images",@"Cars",@"FeedName",@"Ryan Lochte",@"UserName",@"http://i2.wp.com/candieanderson.com/images/old/6a01127964c54a28a40177440097eb970d-pi.jpg",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages6=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://www.wallpaperup.com/uploads/wallpapers/2013/03/20/54788/96398ffb893f2ad859da38c5cf2b7e32.jpg",@"Images",@"Fashion",@"FeedName", @"david kinigson",@"UserName",@"http://t0.gstatic.com/images?q=tbn:ANd9GcTWl9u_X_B-LiUz38nAwcEms8PkcmPHwL3BSe6WElwvXLSPfMJr",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages7=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://hakkasanlv.com/wp-content/gallery/10-24-nervo/hakkasan-nightclub_nervo31.jpg",@"Images",@"NightClub",@"FeedName", @"Ryan Lochte",@"UserName",@"http://i2.wp.com/candieanderson.com/images/old/6a01127964c54a28a40177440097eb970d-pi.jpg",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages8=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://www.wallpaperup.com/uploads/wallpapers/2012/09/30/17321/5e5721c2b6b3b37f25257c9ab53edcbe.jpg",@"Images",@"Sports",@"FeedName", @"Bill Murray",@"UserName",@"http://usatlife.files.wordpress.com/2014/06/xxx-2014-academy-awards-209.jpg",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages9=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://www.wallpaperup.com/uploads/wallpapers/2012/09/25/16315/5b927e28744e3654e08d5b1266303ea3.jpg",@"Images",@"Restaurent",@"FeedName", @"John Mellencand",@"UserName",@"http://www.the-walls.net/wp-content/uploads/2013/03/matthew-bomer-white-collar-usa-actor-fashions-handsome-men-Celebrity.jpg",@"UserProfile",nil];
    
    NSMutableDictionary   *dictForImages10=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://hqwallbase.com/images/big/animals_opossums_wallpaper-569.jpg",@"Images",@"Animals",@"FeedName", @"Wes Dening",@"UserName",@"http://media2.popsugar-assets.com/files/2013/01/02/0/485/4852708/87f3f5d453a8016a_159375884_10.jpg",@"UserProfile",nil];
    
    arrForleadFeed=[[NSMutableArray alloc]initWithObjects:dictForImages1,dictForImages2,dictForImages3,dictForImages4,dictForImages5,dictForImages6,dictForImages7,dictForImages8,dictForImages9,dictForImages10,nil];
    [tableForFeed reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)actionONFeedHeader:(id)sender{
    UIButton *btn=(UIButton*)sender;
    if (btn.tag==0) {
        [imgForHeaderBg setImage:[UIImage imageNamed:@"lead_feed_active.png"]];
    }else{
        [imgForHeaderBg setImage:[UIImage imageNamed:@"hot_lead_tab_active.png"]];
    }
}

#pragma Mark TableView Delegates......

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return arrForleadFeed.count;    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    
    
    UITableViewCell *cell1=nil;
    cell1 = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell1 == nil)
    {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier] ;
    }
    
   customcellSubview = [self.storyboard instantiateViewControllerWithIdentifier:@"MyFeedCustom"];
   //cell1.frame=CGRectMake(0,0, [UIApplication sharedApplication].keyWindow.frame.size.width,755);
            [cell1.contentView addSubview:customcellSubview.view];
            cell1.contentView.backgroundColor=[UIColor clearColor];
            [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
             [customcellSubview setDelegate:self];
    
    [customcellSubview.profileImage loadImage:[[arrForleadFeed objectAtIndex:indexPath.row] objectForKey:@"UserProfile"]];
    [customcellSubview.asyImageView loadImage:[[arrForleadFeed objectAtIndex:indexPath.row] objectForKey:@"Images"]];
    customcellSubview.lblForFeeder.text=[[arrForleadFeed objectAtIndex:indexPath.row] objectForKey:@"UserName"];

//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"mediatype"] isEqualToString:@"Video"])
//        {
//            [customcellSubview.asyImageView loadImage:[[arrayForLeadData objectAtIndex:indexPath.row]valueForKey:@"picture2"]];
//        }else
//        {
//            
//            [customcellSubview.asyImageView loadImage:[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"picture1"]];
//            
//            
//            
//            
//        }
//        
//        [customcellSubview.profileImage loadImage:[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"picture"]];
    
//        imageIndexPath=indexPath.row;
//        Videoindexpath=indexPath.row;
//        NSNumber *intLike = [[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"likecount"];
//        NSNumber *intComment=[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"commentcount"];
//        NSNumber *intView=[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"viewcount"];
//        NSNumber *intLove=[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"lovecount"];
//        NSNumber *intstrFavoritecount=[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"favoritecount"];
//        NSNumber *intstrRelead=[[arrayForLeadData objectAtIndex:indexPath.row]valueForKey:@"releadcount"];
//        NSString* strLikeCount = [intLike stringValue];
//        NSString* strCommentCount = [intComment stringValue];
//        NSString* strViewCount = [intView stringValue];
//        NSString* strLoveCount = [intLove stringValue];
//        NSString* strFavoritecount=[intstrFavoritecount stringValue];
//        NSString* strReleadcount=[intstrRelead stringValue];
//        customcellSubview.lblCommentsCounts.text=strCommentCount;
//        customcellSubview.lblLikeCounts.text=strLikeCount;
//        customcellSubview.lblLoveCount.text=strLoveCount;
//        customcellSubview.lblFavoriteCount.text=strFavoritecount;
//        customcellSubview.lblReleadCount.text=strReleadcount;
//        [customcellSubview.lblViews setText:strViewCount];
//        customcellSubview.lblUsername.text=[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"username"];
//        customcellSubview.lblUsername.tag=indexPath.row;
//        
//        
//        customcellSubview.lblTime.text=[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"createdate"] ;
//        customcellSubview.lblAllLikeUser.text=[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"LikedUserNames"];
//        [customcellSubview.lblCaption setText:[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"caption"]];
//        //============//
//        customcellSubview.lblAllLikeUser.tag=indexPath.row;
//        
//        customcellSubview.lblLoversNames.text=[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"LoversUserNames"];
//        //============//
//        
//        customcellSubview.lblLoversNames.tag=indexPath.row;
//        
//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"commentcount"] integerValue] ==0)
//        {
//            [customcellSubview.btnAllComments setHidden:YES];
//        }
//        else
//        {
//            [customcellSubview.btnAllComments setHidden:NO];
//        }
//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"lovecount"] integerValue] ==0)
//        {
//            [customcellSubview.btnViewAllLovers setHidden:YES];
//        }
//        else
//        {
//            [customcellSubview.btnViewAllLovers setHidden:NO];
//        }
//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"likecount"] integerValue] ==0)
//        {
//            [customcellSubview.btnAllLike setHidden:YES];
//        }
//        else
//        {
//            [customcellSubview.btnAllLike setHidden:NO];
//        }
//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"islike"] integerValue] ==0)
//        {
//            [customcellSubview.btnLike setBackgroundImage:[UIImage imageNamed:@"Like_it.png"] forState:UIControlStateNormal];
//            customcellSubview.btnLike.tag=indexPath.row;
//        }
//        else
//        {
//            [customcellSubview.btnLike setBackgroundImage:[UIImage imageNamed:@"dislike_btn.png"] forState:UIControlStateNormal];
//        }
//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"IsFavorite"] integerValue]==0)
//        {
//            [customcellSubview.btnFav setBackgroundImage:[UIImage imageNamed:@"favorite_btn@2x.png"] forState:UIControlStateNormal];
//        }
//        else
//        {
//            [customcellSubview.btnFav setBackgroundImage:[UIImage imageNamed:@"unfav_btn_new.png"] forState:UIControlStateNormal];
//        }
//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"islove"] integerValue] ==0)
//        {
//            [customcellSubview.btnLove setBackgroundImage:[UIImage imageNamed:@"loveIt_btn.png"] forState:UIControlStateNormal];
//        }
//        else
//        {
//            [customcellSubview.btnLove setBackgroundImage:[UIImage imageNamed:@"loved_btn.png"] forState:UIControlStateNormal];
//        }
//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"mediatype"] isEqualToString:@"Picture"])
//        {
//            [customcellSubview.btnVideoPlay setHidden:YES];
//        }
//        else
//        {
//            [customcellSubview.btnVideoPlay setHidden:NO];
//            
//        }
//        if ([[[arrayForLeadData objectAtIndex:indexPath.row] valueForKey:@"phototagging"] isEqualToString:@""])
//        {
//            [customcellSubview.btnTag setHidden:YES];
//        }else{
//            [customcellSubview.btnTag setHidden:NO];
//        }
//        [customcellSubview.btnUnFav setHidden:YES];
//        [customcellSubview.btnFav setHidden:NO];
//        [customcellSubview.asyImageView setTag:indexPath.row];
//        [customcellSubview.btnLike setTag:indexPath.row];
//        [customcellSubview.btnComment setTag:indexPath.row];
//        [customcellSubview.btnAllLike setTag:indexPath.row];
//        [customcellSubview.profileImage setTag:indexPath.row];
//        [customcellSubview.btnFav setTag:indexPath.row];
//        [customcellSubview.btnAllComments setTag:indexPath.row];
//        [customcellSubview.btnRelead setTag:indexPath.row];
//        [customcellSubview.btnLove setTag:indexPath.row];
//        [customcellSubview.btnLove setTag:indexPath.row];
//        [customcellSubview.btnViewAllLovers setTag:indexPath.row];
//        [customcellSubview.btnVideoPlay setTag:indexPath.row];
//        [customcellSubview.btnStopVideo setTag:indexPath.row];
//        [customcellSubview setBackgroundColor:[UIColor clearColor]];
//        [customcellSubview setBackgroundColor:[UIColor clearColor]];
//        [customcellSubview.viewAlpha setAlpha:0.7];
//        [cell1.contentView addSubview:customcellSubview];
//        cell1.contentView.backgroundColor=[UIColor clearColor];
//        [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
//        customcellSubview.lblAllLikeUser.delegate=self;
//        customcellSubview.lblLoversNames.delegate=self;
//        customcellSubview.lblUsername.delegate=self;
//        
//        
//        
//        NSString *comment=[[arrayForLeadData objectAtIndex:indexPath.row] objectForKey:@"commentdetails"];
//        if (![comment isKindOfClass:[NSNull class]]) {
//            
//            
//            if (comment!=nil && comment.length>0) {
//                
//                NSString *Height=[[arrayForLeadData objectAtIndex:indexPath.row] objectForKey:@"commentHeight"];
//                float commentHeight=[Height floatValue];
//                
//                if (commentHeight>10) {
//                    if (commentHeight<100) {
//                        commentHeight=50;
//                    }
//                    customcellSubview.makeRTLabel.frame=CGRectMake(customcellSubview.makeRTLabel.frame.origin.x, customcellSubview.makeRTLabel.frame.origin.y, customcellSubview.makeRTLabel.frame.size.width, commentHeight);
//                    customcellSubview.makeRTLabel.tag=indexPath.row;
//                    
//                    [customcellSubview.makeRTLabel setDelegate:self];
//                    
//                    
//                    [customcellSubview.makeRTLabel setText:comment];
//                    
//                    
//                    customcellSubview.ViewForRTLabel.frame=CGRectMake(customcellSubview.ViewForRTLabel.frame.origin.x,customcellSubview.makeRTLabel.frame.origin.y+commentHeight, customcellSubview.ViewForRTLabel.frame.size.width, customcellSubview.ViewForRTLabel.frame.size.height);
//                    
//                    customcellSubview.frame=CGRectMake(0, 0, 320, 670+commentHeight);
//                    cell1.frame=CGRectMake(0,0, 320,670+commentHeight);
//                    //cell1.frame=CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
//                }
//            }
//            //Jayesh
//            
//            //  cell1.frame=CGRectMake(0,0, 320,customcellSubview.ViewForRTLabel.frame.origin.y+ customcellSubview.ViewForRTLabel.frame.size.height);
//            
//            // customcellSubview.frame=CGRectMake(0, 0, 320, 670);
//            // cell1.frame=CGRectMake(0,0, 320,670);
//        }
//        
//        
    
        return cell1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
