//
//  STImagePicker.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "STBaseViewController.h"

@interface STImagePicker : UIActionSheet <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

@property(nonatomic, weak) UIViewController *parentViewController;

@end
