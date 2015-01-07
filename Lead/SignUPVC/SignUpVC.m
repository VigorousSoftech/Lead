//
//  SignUpVC.m
//  Lead
//
//  Created by Admin on 15/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "SignUpVC.h"
#import "LoginVC.h"
#import "BlockAlertView.h"
#import "LeadTabBarVC.h"
#import "WebserviceOperation.h"
#import "WhatLikeVC.h"

@interface SignUpVC (){
    AppDelegate *delegate;
    NSArray *arrStatus;
    UIImage *editedImage;
}

@end
@implementation SignUpVC
@synthesize scorllViewForMainView;
@synthesize txtEmail,txtFirstName,txtLastName,txtPassword,txtGEnder,txtUserName,txtAge,txtZipCode;
@synthesize countryPicker,btnCountryCode,btnCamera,viewForAccessory;
@synthesize btnForGender,genderPicker,strForFromFB;

- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationController.navigationBarHidden=YES;
    delegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    [scorllViewForMainView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+200)];
    [countryPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, countryPicker.frame.size.height)];
    
    [genderPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, genderPicker.frame.size.height)];
    genderPicker.delegate=self;
    [viewForAccessory setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, viewForAccessory.frame.size.height)];

    arrStatus = [[NSArray alloc] initWithObjects:@"Male", @"Female", nil];
    countryPicker.delegate = self;
    
   
    
    if ([strForFromFB isEqualToString:@"YES"]) {
        txtEmail.text=[[[NSUserDefaults standardUserDefaults] valueForKey:@"FaceBookData"] valueForKey:@"email"];
        txtLastName.text=[[[NSUserDefaults standardUserDefaults] objectForKey:@"FaceBookData"] valueForKey:@"last_name"];
        txtFirstName.text=[[[NSUserDefaults standardUserDefaults] objectForKey:@"FaceBookData"] valueForKey:@"first_name"];
        [btnCamera loadImage:[[[NSUserDefaults standardUserDefaults] objectForKey:@"FaceBookData"] valueForKey:@"FacebookFBPic"]];
         btnForGender.titleLabel.text =[[[NSUserDefaults standardUserDefaults] objectForKey:@"FaceBookData"] valueForKey:@"gender"];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark OtherClasses
//Email validation check
- (BOOL) validateEmail: (NSString *) candidate
{
    NSString *emailRegex = @"[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

- (BOOL) validateName: (NSString *) candidate
{
    NSString *nameRegex = @"[A-Za-z]+";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [emailTest evaluateWithObject:candidate];
}

#pragma mark IBAction Method
-(IBAction)actionOnBackBtn:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)actionOnCamera:(id)sender{
    
    [self.view endEditing:YES];
    BlockActionSheet *actionSheetProfile=[[BlockActionSheet alloc]initWithTitle:@""];
    actionSheetProfile.delegate=self;
    [actionSheetProfile addButtonWithTitle:@"Take picture" atIndex:0 block:nil];
    [actionSheetProfile addButtonWithTitle:@"Choose from Library" atIndex:1 block:nil];
    [actionSheetProfile setCancelButtonWithTitle:@"Cancel" atIndex:2 block:nil];
    [actionSheetProfile showInView:[UIApplication sharedApplication].keyWindow];
}
-(IBAction)actionOnTapToLogin:(id)sender{
    
}
-(IBAction)actionONCountryCode:(id)sender{
    [self.view endEditing:YES];
    if (countryPicker.frame.origin.y==[UIApplication sharedApplication].keyWindow.frame.size.height) {
        
        [UIView animateWithDuration:.3 animations:^{
            [genderPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, genderPicker.frame.size.height)];

            [scorllViewForMainView setContentOffset:CGPointMake(0, 350)];
            [countryPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height-countryPicker.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, countryPicker.frame.size.height)];
        }];
         NSString *code=[countryPicker selectedCountryName];
        [btnCountryCode setTitle:code forState:UIControlStateNormal];
    }
}
-(IBAction)actionOnPickerDone:(id)sender{
    
}
-(IBAction)actionOnPickerCancel:(id)sender{
    
}
-(IBAction)actionOnAgePickerDone:(id)sender{
    
}
-(IBAction)actionOnAgePickerCancel:(id)sender{
    
}
-(IBAction)actionOnAge:(id)sender{
    
}
-(IBAction)actionOnGender:(id)sender{
    
    [self.view endEditing:YES];
    if (genderPicker.frame.origin.y==[UIApplication sharedApplication].keyWindow.frame.size.height) {
        [UIView animateWithDuration:.3 animations:^{
            [countryPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, countryPicker.frame.size.height)];
            [scorllViewForMainView setContentOffset:CGPointMake(0, 250)];
            [genderPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height-genderPicker.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, genderPicker.frame.size.height)];
        }];
    }
}

-(IBAction)actionOnSignUPDone:(id)sender{
    [self.view endEditing:YES];
    [countryPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, countryPicker.frame.size.height)];
    
    [genderPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, genderPicker.frame.size.height)];
    if ([txtUserName.text isEqualToString:@""] ||[txtPassword.text isEqualToString:@""]||[txtEmail.text isEqualToString:@""]||[txtAge.text isEqualToString:@""]||[txtGEnder.text isEqualToString:@""]) {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Message" message:@"Please required field."];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        return;
    }
    else if( txtEmail == nil || [self validateEmail:txtEmail.text] == NO)
    {
        //    [self killHUD];
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Message" message:@"Please enter valid email"];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        return;
    }
  else  if(txtPassword == nil || [txtPassword.text isEqualToString:@""] || [txtPassword.text isEqualToString:@"(null)"] || [txtPassword.text length]==0 || txtPassword.text.length<6){
        //   [self killHUD];
        //str=[str stringByAppendingFormat:@"\n-Your password should be atleast 6 characters long"];
        
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Message" message:@"Password should be at least 6 characters long"];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        return;
    }
  else  if ([Reachability sharedReachability].internetConnectionStatus==NotReachable) {
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Message" message:@"Internet connection is not available"];
        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
        [alert show];
        return;
    }
    NSData *imgdata=UIImageJPEGRepresentation(captureImage, 0.7);
    NSString *strPicture=[self base64forData:imgdata];
    
    WebserviceOperation *service=[[WebserviceOperation alloc] initWithDelegate:self callback:@selector(SaveUserHandler:)];
    [delegate showHUD];
    if ([strForFromFB isEqualToString:@"YES"]) {
        [service SaveUser:txtFirstName.text lastname:txtLastName.text emailid:txtEmail.text password:txtPassword.text username:txtUserName.text fbid:[[[NSUserDefaults standardUserDefaults] valueForKey:@"FaceBookData"] valueForKey:@"facebookid"] gender:btnForGender.titleLabel.text age:txtAge.text country:btnCountryCode.titleLabel.text whatlike:@"Movie" deviceid:@"" lastlogin:@"" profile:strPicture profile_picture_url:[[[NSUserDefaults standardUserDefaults] valueForKey:@"FaceBookData"] valueForKey:@"FacebookFBPic"]];
    }
    else{
         [service SaveUser:txtFirstName.text lastname:txtLastName.text emailid:txtEmail.text password:txtPassword.text username:txtUserName.text fbid:@"" gender:btnForGender.titleLabel.text age:txtAge.text country:btnCountryCode.titleLabel.text whatlike:@"Movie" deviceid:@"" lastlogin:@"" profile:strPicture profile_picture_url:@""];
    }
}

-(IBAction)actionTapToLogin:(id)sender{
    LoginVC *objLogin = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
    [self.navigationController pushViewController:objLogin animated:YES];
}

#pragma mark WebService Handler


-(void)SaveUserHandler:(id)sender{
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
                    NSString *str=[[(NSDictionary*)strForResponce  valueForKey:@"emailid"] objectAtIndex:0];
                    NSLog(@"value of str %@",str);
                    if ([str isEqualToString:@"Email Already Exists"]) {
                        
                        BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"Message" message:str];
                        [alert setDestructiveButtonWithTitle:@"OK" block:nil];
                        [alert show];
                        return;
                    }else{
                        NSArray *dic=(NSArray*)strForResponce;
                        
                        delegate.dictUserValue=[dic objectAtIndex:0];
                        
                        WhatLikeVC *objFind=[self.storyboard instantiateViewControllerWithIdentifier:@"WhatLike"];
                        [self.navigationController pushViewController:objFind animated:YES];

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


#pragma mark Coutory Picker
- (void)countryPicker:(CountryPicker *)picker didSelectCountryWithName:(NSString *)name code:(NSString *)code{
    
    NSString *newName=name;
    
    [btnCountryCode setTitle:newName forState:UIControlStateNormal];
    
}

//==================================================
#pragma mark - UITextField delegate method
//==================================================

-(void)textFieldDidBeginEditing:(UITextField *)textField{
   // viewFoorTable.hidden=YES;
    if (textField==txtEmail )
    {
        [UIView animateWithDuration:.2 animations:^{
            [scorllViewForMainView setContentOffset:CGPointMake(0, 80)];
        }];
    }else if (textField==txtFirstName || textField==txtLastName || textField==txtGEnder  )
    {
        [UIView animateWithDuration:.2 animations:^{
            [scorllViewForMainView setContentOffset:CGPointMake(0, 150)];
        }];
    }
    else if (textField==txtAge ) {
       // [txtAge setInputAccessoryView:viewForAccessory];
        [UIView animateWithDuration:.2 animations:^{
            [scorllViewForMainView setContentOffset:CGPointMake(0, 300)];
        }];
    }
    else if (textField==txtZipCode)
    {
      //  [txtZipCode setInputAccessoryView:viewForAccessory];
        [UIView animateWithDuration:.2 animations:^{
            [scorllViewForMainView setContentOffset:CGPointMake(0, 450)];
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    if ([strFblogin isEqualToString:@"isFBlogin"]) {
//        viewFoorTable.hidden=YES;
//        if (textField==txtUserName)
//        {
//            [txtPassword becomeFirstResponder];
//        }else if (textField==txtPassword )
//        {
//            
//            [txtFirstName becomeFirstResponder];
//        }else if(textField==txtFirstName)
//        {
//            [txtLastName becomeFirstResponder];
//        }else if(textField==txtLastName)
//        {
//            [txtAge becomeFirstResponder];
//        }else if(textField==txtAge)
//        {
//            [txtZipCode becomeFirstResponder];
//        }else
//        {
//            [textField resignFirstResponder];
//            [UIView animateWithDuration:.2 animations:^{
//                [scorllViewForMainView setContentOffset:CGPointMake(0, 0)animated:YES];
//            }];
//        }
//    }else
//    {
       // viewFoorTable.hidden=YES;
        if (textField==txtUserName)
        {
            [txtPassword becomeFirstResponder];
        }else if (textField==txtPassword )
        {
            if (![txtEmail isUserInteractionEnabled])
            {
                [txtFirstName becomeFirstResponder];
            }else
            {
                [txtEmail becomeFirstResponder];
            }
        }else if (textField ==txtEmail)
        {
            [txtFirstName becomeFirstResponder];
        }else if(textField==txtFirstName)
        {
            [txtLastName becomeFirstResponder];
        }else if(textField==txtLastName)
        {
            [txtAge becomeFirstResponder];
        }else if(textField==txtAge)
        {
            [txtZipCode becomeFirstResponder];
        }else
        {
            [textField resignFirstResponder];
            [UIView animateWithDuration:.2 animations:^{
                [scorllViewForMainView setContentOffset:CGPointMake(0, 0)animated:YES];
            }];
        }
    
    [genderPicker setFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, genderPicker.frame.size.height)];

   // }
   	
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField==txtZipCode)
    {
        
        NSString *newString = [txtZipCode.text stringByReplacingCharactersInRange:range withString:string];
        return !([newString length] > 6);
    }
    else if (textField==txtAge){
        NSString *newString = [txtAge.text stringByReplacingCharactersInRange:range withString:string];
        return !([newString length] > 2);
        
    }
    NSString *resultingString = [textField.text stringByReplacingCharactersInRange: range withString: string];
    NSCharacterSet *whitespaceSet = [NSCharacterSet whitespaceCharacterSet];
    if  ([resultingString rangeOfCharacterFromSet:whitespaceSet].location == NSNotFound)
    {
        return YES;
    }  else
    {
        return NO;
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITextField *txt in self.view.subviews)
    {
        if ([txt isFirstResponder])
        {
            [txt resignFirstResponder];
        }
    }
    if (self.view.frame.origin.y<0)
    {
        [UIView animateWithDuration:.2 animations:^{
            [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }];
    }
}

-(BOOL)textFieldShouldBeginEditing: (UITextField *)textField

{
    if (txtAge==textField||txtZipCode==textField)
    {
        
        // [keyboardToolBar setBackgroundImage:[UIImage imageNamed:@"header_blank@1x_New.png"] forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsDefault];
        //textField.inputAccessoryView = keyboardToolBar;
        // txtZipCode.inputAccessoryView=keyboardToolBar;
    }else{
        
        
    }
    
    return YES;
    
}

-(void)resignKeyboard
{
    [scorllViewForMainView setContentOffset:CGPointMake(0, 0)animated:YES];
    for (UITextField* key in self.scorllViewForMainView.subviews )
    {
        [key resignFirstResponder];
        // do stuff
    }
    
}



//==================================================
#pragma mark - Action Sheet Delegates
//==================================================

- (void)actionSheet:(BlockActionSheet *)actionSheet1 clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title=[actionSheet1 buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Choose from Library"]){
        [self chooseImageFromLibrary:@""];
    }else if([title isEqualToString:@"Take picture"]){
        if ([UIImagePickerController isCameraDeviceAvailable:YES])
        {
            //[self takeImageFromCamera:@""];
        }else
        {
            BlockAlertView *alert=[[BlockAlertView alloc]initWithTitle:@"" message:@"Camera is not available on your device" ];
            [alert addButtonWithTitle:@"OK" block:nil];
            [alert show];
        }
    }
}

#pragma mark PickerViewDelegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return arrStatus.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [arrStatus objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [btnForGender setTitle:[arrStatus objectAtIndex:row] forState:UIControlStateNormal];
}



//********************Open camera***************///
/*
 -(void)takeImageFromCamera:(id)sender
 {
 if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
 ImagePickerControllerClassLookshots *object = [[ImagePickerControllerClassLookshots alloc] init];
 object.imgCaptDelegate=self;
 object.strSignup=@"isSignup";
 [self presentModalViewController:object animated:NO];
 }
 }
 
 - (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
 {
 if ([UIImagePickerController isSourceTypeAvailable:sourceType])
 {
 // cameraFromSignUp = YES;
 if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
 {
 ImagePickerControllerClassLookshots *obj = [[ImagePickerControllerClassLookshots alloc] init];
 obj.delegate=self;
 //[self presentModalViewController:obj animated:YES];
 [self presentViewController:obj animated:YES completion:nil];
 }
 }
 }

 */


//tracker 613 custom camera screen

//Choose image from library
-(void)chooseImageFromLibrary:(id)sender
{
    UIImagePickerController *controller=[[UIImagePickerController alloc] init];
    [controller setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [controller setEditing:YES];
    [controller setDelegate:self];
    controller.allowsEditing = YES;
    
    //    if (isiPhone)
    //    {
    if ([self respondsToSelector:@selector(presentModalViewController:animated:)])
    {   //Deprecated in iOS6
        [self presentModalViewController:controller animated:YES];
    }
    else{
        [self presentViewController:controller animated:YES completion:nil];
    }
    //    }
    //    else{
    //        popOverController = [[UIPopoverController alloc]initWithContentViewController:controller];
    //        [popOverController presentPopoverFromRect:self.view.bounds inView:self.view permittedArrowDirections:NO animated:YES];
    //    }
}


//==================================================
#pragma mark - UIImagePickerController delegate methods
//==================================================
-(void) changeImageInMakePost:(UIImage *)photo{
    //captureImage=photo;
    //nextButtonFlag=NO;
   // btnCamera.layer.cornerRadius=3.0;
    //[btnCamera setImage:photo forState:UIControlStateNormal];
    [self dismissModalViewControllerAnimated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    if (popOverController)
    {
        [popOverController dismissPopoverAnimated:YES];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    editedImage =[[UIImage alloc]init];
    captureImage=[info objectForKey:UIImagePickerControllerEditedImage];
    editedImage = [self resizeImage:[info objectForKey:UIImagePickerControllerEditedImage] contextSize:CGSizeMake(150, 150) targetSize:CGRectMake(0, 0, 150, 150)];
    if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary)
    {
        if (popOverController)
        {
            [popOverController dismissPopoverAnimated:YES];
         }       //userimage.image=editedImage;
       btnCamera.layer.cornerRadius=2.0;
       btnCamera.layer.borderColor=[UIColor darkGrayColor].CGColor;
        [btnCamera setBackgroundImage:editedImage forState:UIControlStateNormal];
//       [btnCamera setImage:editedImage forState:UIControlStateNormal];
       [picker dismissViewControllerAnimated:NO completion:nil];
    }
    else  if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
        {
            if (popOverController)
            {
                [popOverController dismissPopoverAnimated:YES];
            }
            //userimage.image=editedImage;
            btnCamera.layer.cornerRadius=2.0;
            btnCamera.layer.borderColor=[UIColor darkGrayColor].CGColor;
        [btnCamera setBackgroundImage:editedImage forState:UIControlStateNormal];
            [picker dismissViewControllerAnimated:NO completion:nil];
        }
}

-(UIImage *)resizeImage:(UIImage*)imge contextSize :(CGSize)contextSize targetSize:(CGRect)targetSize
{
    UIGraphicsBeginImageContext(CGSizeMake(contextSize.width, contextSize.height));
    [imge drawInRect:CGRectMake(0,0,targetSize.size.width,targetSize.size.height)];
    imge = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imge;
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
