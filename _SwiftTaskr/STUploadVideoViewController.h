//
//  STUploadVideoViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STUploadVideoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *uploadVideoView;
@property (strong, nonatomic) IBOutlet UIButton *uploadVideoButton;

@property (strong, nonatomic) IBOutlet UIView *takeVideoView;

@property (strong, nonatomic) IBOutlet UIButton *takeVideoButton;


@property (strong, nonatomic) IBOutlet UIView *uploadCompletedView;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;

@property (strong, nonatomic) IBOutlet UIButton *userImageButton;

@property (strong, nonatomic) IBOutlet UIButton *exampleButton;
@property (strong, nonatomic) IBOutlet UIButton *finishButton;

#pragma mark - Action


@end
