//
//  SplashVC.m
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "SplashVC.h"

@interface SplashVC ()

@end

@implementation SplashVC
@synthesize viewForSignup,viewForBtn,imgForSplash;

- (void)viewDidLoad {
    [super viewDidLoad];
    
            filepath   =   [[NSBundle mainBundle] pathForResource:@"SplashVideo_iPhone5" ofType:@"mp4"];
    
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
     [[moviePlayerController view] setFrame:[self.view bounds]];
    [moviePlayerController setControlStyle:MPMovieControlStyleNone];
    [self.view addSubview:moviePlayerController.view];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(movieFinishedCallback:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:moviePlayerController];
    
    [moviePlayerController prepareToPlay];
    [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(targetMethod)
                                   userInfo:nil
                                    repeats:NO];
    [moviePlayerController play];
    appDelegate=(AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    [viewForSignup setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, viewForSignup.frame.size.height)];
    
    [viewForBtn setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, viewForBtn.frame.size.height)];

    // Do any additional setup after loading the view.
}

-(void)targetMethod{
   
    [moviePlayerController pause];
    [self.view bringSubviewToFront:imgForSplash];
    [UIView animateWithDuration:0.5 animations:^{
        [self.view bringSubviewToFront:viewForBtn];
        [viewForBtn setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height-viewForBtn.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, viewForBtn.frame.size.height)];
    }];
    //   [self performSelector:@selector(splashScreen) withObject:(nil) afterDelay:0.0f];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=YES;
}

- (void) movieFinishedCallback:(NSNotification*) aNotification {
    
    
    MPMoviePlayerController *player = [aNotification object];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
 }
-(void)splashScreen
{
    
}

@end
