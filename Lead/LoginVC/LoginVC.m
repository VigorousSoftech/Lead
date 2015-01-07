//
//  LoginVC.m
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

int intForFBCall;

#import "LoginVC.h"
#import "SignUpVC.h"
#import "AppDelegate.h"
#import "LeadTabBarVC.h"
#import "WhatLikeVC.h"
#import "SignUpVC.h"

@interface LoginVC (){
    NSArray *permissions;
}

@end

@implementation LoginVC
@synthesize txtPassword,txtUserName;
@synthesize btnFb,btnForgetPass;
@synthesize txtEmilId;
@synthesize imgd,imgBg ,viewForForget,txtForEmailForget,viewForForgetNew;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
        self.navigationController.navigationBar.backgroundColor=[UIColor redColor];
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    txtForEmailForget.delegate=self;
    viewForForget.hidden=YES;
    viewForForgetNew.hidden=YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleChange:)
                                                 name:@"FBLogin"
                                               object:nil];
    permissions = [[NSArray alloc] initWithObjects:@"publish_stream",@"read_stream",@"offline_access",@"email", nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma  mark Facebook Work
- (void)handleChange:(NSNotification *)note {
       [self apiFQLIMe];
}


-(IBAction)actionOnLoginWithFB:(id)sender{
   intForFBCall=0;
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    // HackbookAppDelegate *delegate = (HackbookAppDelegate *)[[UIApplication sharedApplication] delegate];
    if (![[appDelegate facebook] isSessionValid]) {
        [[appDelegate facebook] authorize:permissions];
    } else {
        [self apiFQLIMe];
    }
}

- (void)apiFQLIMe {
    [delegate showHUD];
    // Using the "pic" picture since this currently has a maximum width of 100 pixels
    // and since the minimum profile picture size is 180 pixels wide we should be able
    // to get a 100 pixel wide version of the profile picture
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"SELECT uid, first_name, last_name, name, pic,pic_small, pic_big, birthday_date, sex, current_location,profile_url, email, is_app_user,pic_cover FROM user WHERE uid=me()", @"query",
                                   nil];
    [[delegate facebook] requestWithMethodName:@"fql.query"
                                                      andParams:params
                                                  andHttpMethod:@"POST"
                                                    andDelegate:self];
    [ [delegate facebook] requestWithGraphPath: @"me" andDelegate: self];
}

- (void)apiGraphUserPermissions {
    [[delegate facebook] requestWithGraphPath:@"me/permissions" andDelegate:self];
}

#pragma mark - FBSessionDelegate Methods
/**
 * Called when the user has logged in successfully.
 */
- (void)fbDidLogin {
    //    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self storeAuthData:[[delegate facebook] accessToken] expiresAt:[[delegate facebook] expirationDate]];
    //    [pendingApiCallsController userDidGrantPermission];
}

-(void)fbDidExtendToken:(NSString *)accessToken expiresAt:(NSDate *)expiresAt {
    [self storeAuthData:accessToken expiresAt:expiresAt];
}

/** Called when the user canceled the authorization dialog.*/

-(void)fbDidNotLogin:(BOOL)cancelled {
    //    [pendingApiCallsController userDidNotGrantPermission];
}

- (void)storeAuthData:(NSString *)accessToken expiresAt:(NSDate *)expiresAt {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:accessToken forKey:@"FBAccessTokenKey"];
    [defaults setObject:expiresAt forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}

/**Called when the request logout has succeeded.*/
- (void)fbDidLogout {
    //    pendingApiCallsController = nil;
    // Remove saved authorization information if it exists and it is
    // ok to clear it (logout, session invalid, app unauthorized)
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"FBAccessTokenKey"];
    [defaults removeObjectForKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}

/**Called when the session has expired.*/
- (void)fbSessionInvalidated {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Auth Exception"
                              message:@"Your session has expired."
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil,
                              nil];
    [alertView show];
    [self fbDidLogout];
}

#pragma mark - FBRequestDelegate Methods
/**
 * Called when the Facebook API request has returned a response.
 *
 * This callback gives you access to the raw response. It's called before
 * (void)request:(FBRequest *)request didLoad:(id)result,
 * which is passed the parsed response object.
 */
- (void)request:(FBRequest *)request didReceiveResponse:(NSURLResponse *)response {
    //NSLog(@"received response");
}

/***Called when a request returns and its response has been parsed into
 * an object. * * The resulting object may be a dictionary, an array or a string, depending * on the format of the API response. If you need access to the raw response,
 * use: * * (void)request:(FBRequest *)request *didReceiveResponse:(NSURLResponse *)response*/
- (void)request:(FBRequest *)request didLoad:(id)result{
        if ([result count]>0) {
            NSMutableDictionary *fbData=[[NSMutableDictionary alloc]init];
            [fbData setValue:[[result  valueForKey:@"first_name"] copy] forKey:@"first_name"];
            [fbData setValue:[[result  valueForKey:@"last_name"] copy] forKey:@"last_name"];
            [fbData setValue:[[result  valueForKey:@"email"] copy] forKey:@"email"];
            [fbData setValue:[[result  valueForKey:@"gender"] copy] forKey:@"gender"];
            [fbData setValue:[[result  valueForKey:@"id"] copy] forKey:@"facebookid"];
            NSString *str = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large",[fbData valueForKey:@"facebookid"]];
            [fbData setValue:str forKey:@"FacebookFBPic"];
            [[NSUserDefaults standardUserDefaults] setObject:fbData forKey:@"FaceBookData"];
            [NSUserDefaults standardUserDefaults];
            
            
            WebserviceOperation *service=[[WebserviceOperation alloc] initWithDelegate:self callback:@selector(LoginUserHandler:)];
            [delegate showHUD];
            [service LoginUser:@"" password:@"" fbid:[fbData valueForKey:@"facebookid"]];
            
//            [self SignUpCallViaFacebook:fbData];
       }
}

#pragma mark IBAction Method

-(IBAction)actionOnLogin:(id)sender{
    
    
    LeadTabBarVC *objLogin = [self.storyboard instantiateViewControllerWithIdentifier:@"LeadTabBar"];
    [self.navigationController pushViewController:objLogin animated:YES];
    return;
    
    if ([txtEmilId.text isEqualToString:@""]||[txtPassword.text isEqualToString:@""]) {
        BlockAlertView *alert =[[BlockAlertView alloc]initWithTitle:@"Message" message:@"Please fill blank fields."];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        return;
    }else if ([self validateEmail:txtEmilId.text] == NO){
        BlockAlertView *alert =[[BlockAlertView alloc]initWithTitle:@"Message" message:@"Please enter valid email"];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        return;
    }
    else
    {
        if ([Reachability sharedReachability].internetConnectionStatus==NotReachable) {
            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Message" message:@"Internet connection is not available"];
            [alert setDestructiveButtonWithTitle:@"OK" block:nil];
            [alert show];
            return;
        }else{
        
      WebserviceOperation *service=[[WebserviceOperation alloc] initWithDelegate:self callback:@selector(LoginUserHandler:)];
            [delegate showHUD];
    [service LoginUser:txtEmilId.text password:txtPassword.text fbid:@""];
        }
    }
}


-(void)LoginUserHandler:(id)sender{
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
        if (error==nil) {
            if ([strForResponce isKindOfClass:[NSArray class]]) {
                 NSArray *arr=(NSArray*)strForResponce;
                delegate.dictUserValue =[arr objectAtIndex:0];
                LeadTabBarVC *objLogin = [self.storyboard instantiateViewControllerWithIdentifier:@"LeadTabBar"];
                [self.navigationController pushViewController:objLogin animated:YES];
            }else{
                NSMutableDictionary *dict=(NSMutableDictionary*)strForResponce;
                if ([[dict valueForKey:@"message"] isEqualToString:@"New Facebook User"]) {
                    SignUpVC *objLogin = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUp"];
                    objLogin.strForFromFB=@"YES";
                    [self.navigationController pushViewController:objLogin animated:YES];
                    [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"FirstFB"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                }else{
                    delegate.dictUserValue =[dict mutableCopy];
                    LeadTabBarVC *objLogin = [self.storyboard instantiateViewControllerWithIdentifier:@"LeadTabBar"];
                    [self.navigationController pushViewController:objLogin animated:YES];
                }
            }
        }
    }
}

-(IBAction)actionOnForgatePass:(id)sender{
    if ([viewForForget isHidden]) {
        [UIView animateWithDuration:0.5 animations:^{
            viewForForget.hidden=NO;
            viewForForgetNew.hidden=NO;
        }];
    }
}

-(IBAction)actionOnCencelButton:(id)sender{
    if (![viewForForget isHidden]) {
        [UIView animateWithDuration:0.5 animations:^{
            viewForForget.hidden=YES;
            viewForForgetNew.hidden=YES;
        }];
    }
}
-(IBAction)actionOnOK:(id)sender{
    if (![viewForForget isHidden]) {
        [UIView animateWithDuration:0.5 animations:^{
            viewForForget.hidden=YES;
            viewForForgetNew.hidden=YES;
        }];
    }
}
-(IBAction)actionOnBackBtn:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark OtherClasses
- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}


#pragma mark - UITextField delegate method
//==================================================

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField==txtPassword ) {
        [UIView animateWithDuration:.2 animations:^{
            [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }];
        
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField==txtEmilId)
    {
        [txtPassword becomeFirstResponder];
    }else if (textField==txtPassword )
    {
        [textField resignFirstResponder];
    }
    else if (textField==txtForEmailForget){
        [textField resignFirstResponder];
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [txtPassword resignFirstResponder];
    [txtUserName resignFirstResponder];
    [txtForEmailForget resignFirstResponder];
    [UIView animateWithDuration:.3 animations:^{
//        if (self.view.frame.origin.y<0) {
//            if (isiPhone) {
//                self.view.frame=CGRectMake(0,0, 320, self.view.frame.size.height);
//            }else{
//                self.view.frame=CGRectMake(0,0, 768, self.view.frame.size.height);
//            }
//            
//        }
    }];
}



-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField==txtPassword) {
        [UIView animateWithDuration:.3 animations:^{
            if (self.view.frame.origin.y<0) {
//                if (isiPhone) {
//                    self.view.frame=CGRectMake(0,0, 320, self.view.frame.size.height);
//                }else{
//                    self.view.frame=CGRectMake(0,0, 768, self.view.frame.size.height);
//                }
                
            }
        }];
    }
}


-(void)SignUpCallViaFacebook:(NSMutableDictionary*)FBDict{
    
    WebserviceOperation *service=[[WebserviceOperation alloc] initWithDelegate:self callback:@selector(SaveUserHandlerFB:)];
    [delegate showHUD];
    [service SaveUser:[FBDict valueForKey:@"first_name"] lastname:[FBDict valueForKey:@"last_name"] emailid:[FBDict valueForKey:@"email"] password:@"" username:@"" fbid:@"" gender:@"" age:@"" country:@"" whatlike:@"Movie" deviceid:@"" lastlogin:@"" profile:@"" profile_picture_url:[FBDict valueForKey:@"FacebookFBPic"]];
}
-(void)SaveUserHandlerFB:(id)sender{
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
                    if ([str isKindOfClass:[NSNull class]]) {
                        NSArray *dic=(NSArray*)strForResponce;
                        
                        delegate.dictUserValue=[dic objectAtIndex:0];
                        
                        WhatLikeVC *objFind=[self.storyboard instantiateViewControllerWithIdentifier:@"WhatLike"];
                        [self.navigationController pushViewController:objFind animated:YES];
                        
                    }else{
                        
                        BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Error" message:str];
                        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
                        [alert show];
                        return;
                    }
                }else{
                    NSMutableDictionary *dic=(NSMutableDictionary*)strForResponce;
                    
                    delegate.dictUserValue=dic;
                    
                    WhatLikeVC *objFind=[self.storyboard instantiateViewControllerWithIdentifier:@"WhatLike"];
                    [self.navigationController pushViewController:objFind animated:YES];
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

- (NSString*)base64forData:(NSData*)theData
{
    
    const uint8_t* input = (const uint8_t*)[theData bytes];
    
    NSInteger length = [theData length];
    
    
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    
    
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    
    uint8_t* output = (uint8_t*)data.mutableBytes;
    
    
    
    NSInteger i;
    
    for (i=0; i < length; i += 3)
    {
        
        NSInteger value = 0;
        
        NSInteger j;
        
        for (j = i; j < (i + 3); j++)
        {
            
            value <<= 8;
            
            
            
            if (j < length)
            {
                
                value |= (0xFF & input[j]);
                
            }
            
        }
        
        
        
        NSInteger theIndex = (i / 3) * 4;
        
        output[theIndex + 0] =                    table[(value >> 18) & 0x3F];
        
        output[theIndex + 1] =                    table[(value >> 12) & 0x3F];
        
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
        
    }
    
    
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
}


@end
