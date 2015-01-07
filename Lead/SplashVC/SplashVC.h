//
//  SplashVC.h
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <MediaPlayer/MediaPlayer.h>

@interface SplashVC : UIViewController<MPMediaPickerControllerDelegate>{
    AppDelegate *appDelegate;
    UIView *viewForSignup;
    MPMoviePlayerController *moviePlayerController;
    NSString *filepath;
    AppDelegate *delegate;
}
@property(strong,nonatomic)IBOutlet UIView *viewForSignup;
@property(strong,nonatomic)IBOutlet UIView *viewForBtn;
@property(strong, nonatomic) IBOutlet UIImageView *imgForSplash;

@end
