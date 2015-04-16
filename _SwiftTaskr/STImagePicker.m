//
//  STImagePicker.m
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STImagePicker.h"

@implementation STImagePicker

- (id)init
{
    self = [super initWithTitle:@"Add Picture" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a photo", @"Browse from gallery", nil];
    self.tag = 909090;
    
    if ( self ) {
        self.delegate = self;
    }
    
    return self;
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self imagePicker:UIImagePickerControllerSourceTypeCamera];
            break;
        case 1:
            [self imagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
            break;

        default:
            break;
    }
    
}

- (void)imagePicker:(UIImagePickerControllerSourceType)type
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = _parentViewController;
    picker.allowsEditing = YES;
    picker.sourceType = type;
    
    [_parentViewController presentViewController:picker animated:YES completion:NULL];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
