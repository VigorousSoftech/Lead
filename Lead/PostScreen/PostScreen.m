//
//  PostScreen.m
//  Lead
//
//  Created by Admin on 16/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "PostScreen.h"
#import "PostDetailVC.h"
#import "LeadTabBarVC.h"

@interface PostScreen (){
    LeadTabBarVC *leadTabBarObj;
    NSString *strForImagePiked;
}

@end

@implementation PostScreen

- (void)viewDidLoad {
    strForImagePiked=@"NO";
    
    leadTabBarObj=[self.storyboard instantiateViewControllerWithIdentifier:@"LeadTabBar"];
    
    [super viewDidLoad];
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]
                                                 init];
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    if ([strForImagePiked isEqualToString:@"YES"]) {
        PostDetailVC *objPostDetail=[self.storyboard instantiateViewControllerWithIdentifier:@"PostDetail"];
        [objPostDetail.imgFirst setBackgroundImage:editedImage forState:UIControlStateNormal];
        [self.navigationController pushViewController:objPostDetail animated:YES];
    }
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    editedImage = [self resizeImage:[info objectForKey:UIImagePickerControllerEditedImage] contextSize:CGSizeMake(150, 150) targetSize:CGRectMake(0, 0, 150, 150)];
    strForImagePiked=@"YES";
    if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary)
    {
        if (popOverController)
        {
            [popOverController dismissPopoverAnimated:YES];
        }       //userimage.image=editedImage;
        [picker dismissViewControllerAnimated:NO completion:^{
            [self performSelector:@selector(PushForDelay) withObject:nil afterDelay:0.5];
        }];
        
        }
    else  if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        if (popOverController)
        {
            [popOverController dismissPopoverAnimated:YES];
        }
        //userimage.image=editedImage;
        
        [picker dismissViewControllerAnimated:NO completion:^{
            [self performSelector:@selector(PushForDelay) withObject:nil afterDelay:0.5];
        }];    }
}

-(UIImage *)resizeImage:(UIImage*)imge contextSize :(CGSize)contextSize targetSize:(CGRect)targetSize
{
    UIGraphicsBeginImageContext(CGSizeMake(contextSize.width, contextSize.height));
    [imge drawInRect:CGRectMake(0,0,targetSize.size.width,targetSize.size.height)];
    imge = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imge;
}

-(void)PushForDelay{
    }


@end
