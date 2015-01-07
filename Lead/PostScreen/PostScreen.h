//
//  PostScreen.h
//  Lead
//
//  Created by Admin on 16/12/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockActionSheet.h"
#import "BlockActionSheet.h"
@interface PostScreen : UIViewController<BlockActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
    UIPopoverController *popOverController;
    UIImage *captureImage;
     UIImage *editedImage;
}

@end
