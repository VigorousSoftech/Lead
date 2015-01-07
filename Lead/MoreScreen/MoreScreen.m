//
//  MoreScreen.m
//  Lead
//
//  Created by Admin on 16/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MoreScreen.h"
#import "BlockAlertView.h"
#import "SplashVC.h";

@interface MoreScreen ()

@end

@implementation MoreScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark IBAction Method
-(IBAction)actionOnALLButton:(UIButton*)btn{
    if (btn.tag==0) {
        
    }
    else if (btn.tag==1){
        
    }
    else if (btn.tag==2){
        
    }
    else if (btn.tag==3){
        
    }
    else if (btn.tag==4){
        
    }
    else if (btn.tag==5){
        BlockAlertView *alert =[[BlockAlertView alloc]initWithTitle:@"LogOut" message:@"Do you want to LogOut"];
        [alert setCancelButtonWithTitle:@"Cancel" block:nil];
        [alert setDestructiveButtonWithTitle:@"OK" block:^{
            [self performSelector:@selector(pushToRoot) withObject:nil afterDelay:0.4];
        }];
        [alert show];
    }
}
-(void)pushToRoot{
    SplashVC *objSplash=[self.storyboard instantiateViewControllerWithIdentifier:@"SplashClass"];
    [self.navigationController popToViewController:objSplash animated:YES];
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
