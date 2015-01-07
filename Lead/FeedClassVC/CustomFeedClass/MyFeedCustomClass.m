//
//  MyFeedCustomClass.m
//  Lead
//
//  Created by Admin on 28/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MyFeedCustomClass.h"

@interface MyFeedCustomClass ()

@end

@implementation MyFeedCustomClass
@synthesize delegate,viewForMainBG,lblForFeeder;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UITapGestureRecognizer *singleFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleFingerDoubleTap:)];
//    
//    singleFingerDoubleTap.numberOfTapsRequired = 1;
//    [asyImageView addGestureRecognizer:singleFingerDoubleTap];
//    
//    //[singleFingerDTap release];
//    UITapGestureRecognizer *singleFingerDoubleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleFingerDoubleTap2:)];
//    
//    singleFingerDoubleTap2.numberOfTapsRequired = 2;
//    [asyImageView addGestureRecognizer:singleFingerDoubleTap2];
//    
//    
//    [singleFingerDoubleTap requireGestureRecognizerToFail:singleFingerDoubleTap2];
//    
//    
//    
//    
//    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognizer:)];
//    
//    
//    [asyImageView addGestureRecognizer:pinchGestureRecognizer];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark- UIButton Action
//
//-(void)pinchGestureRecognizer:(UIPinchGestureRecognizer*)sender{
//    if ([delegate respondsToSelector:@selector(myFeedOnZoom:)])
//    {
//        
//        [delegate myFeedOnZoom:sender.view];
//    }
//    
//}
//-(void)handleSingleFingerDoubleTap:(UITapGestureRecognizer*)sender {
//    
//    
//    if ([delegate respondsToSelector:@selector(myFeedOnFeedImage:)])
//    {
//        
//        [delegate myFeedOnFeedImage:sender.view.tag];
//    }
//    
//    
//}
//
//-(void)handleSingleFingerDoubleTap2:(UITapGestureRecognizer*)sender {
//    
//    //         //show tag
//    //    if ([delegate respondsToSelector:@selector(myFeedOnTaging:)])
//    //    {
//    //        [delegate myFeedOnTaging:sender.view];
//    //    }
//    
//    //like image
//    
//    if ([delegate respondsToSelector:@selector(myFeedOnLikeButton:)])
//    {
//        [delegate myFeedOnLikeButton:sender.view.tag];
//    }
//    
//    
//    
//}
//
//
//-(IBAction)actionOnProfileImage:(UIButton *)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnProfileImage:)])
//    {
//        [delegate myFeedOnProfileImage:sender.tag];
//    }
//}
//-(IBAction)actionOnFeedImage:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnFeedImage:)])
//    {
//        
//        [delegate myFeedOnFeedImage:sender.tag];
//    }
//    
//}
//-(IBAction)actionOnReLead:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnReLeadButton:)])
//    {
//        [delegate myFeedOnReLeadButton:sender.tag];
//    }
//    
//}
//-(IBAction)actionOnFavroite:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnFaveroiteButton:)])
//    {
//        [delegate myFeedOnFaveroiteButton:sender.tag];
//    }
//    
//}
//-(IBAction)actionOnViewLike:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnViewAllLike:)])
//    {
//        [delegate myFeedOnViewAllLike:sender.tag];
//    }
//    
//}
//-(IBAction)actionOnViewComment:(UIButton*)sender
//{
//    
//    
//    if ([delegate respondsToSelector:@selector(myFeedOnViewAllComments:)])
//    {
//        [delegate myFeedOnViewAllComments:sender.tag];
//    }
//}
//-(IBAction)actionOnLikeButton:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnLikeButton:)])
//    {
//        [delegate myFeedOnLikeButton:sender.tag];
//    }    
//}
//-(IBAction)actionOnCommentButton:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnComment:)])
//    {
//        [delegate myFeedOnComment:sender.tag];
//    }
//    
//}
//-(IBAction)actionOnUnFavroite:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnUNFaveroiteButton:)])
//    {
//        [delegate myFeedOnUNFaveroiteButton:sender.tag];
//    }
//    
//}
//-(IBAction)actionOnLove:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnLoveButton:)])
//    {
//        [delegate myFeedOnLoveButton:sender.tag];
//    }
//}
//-(IBAction)actionOnVeiwLovers:(UIButton*)sender
//{
//    
//    
//    if ([delegate respondsToSelector:@selector(myFeedOnViewAllLovers:)])
//    {
//        [delegate myFeedOnViewAllLovers:sender.tag];
//    }
//}
//-(IBAction)actionOnVideoButton:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnPlayVideo:)])
//    {
//        [delegate myFeedOnPlayVideo:sender.tag];
//    }
//    
//}
//-(IBAction)actionOnStopVideo:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnStopVideo:)])
//    {
//        
//        [delegate myFeedOnStopVideo:sender.tag];
//    }
//}
//
//-(IBAction)videoplayfeed:(UIButton*)sender
//{
//    
//    
//}
//
//-(IBAction)actionOnTaging:(UIButton*)sender
//{
//    if ([delegate respondsToSelector:@selector(myFeedOnTaging:)])
//    {
//        [delegate myFeedOnTaging:self.asyImageView];
//    }
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
