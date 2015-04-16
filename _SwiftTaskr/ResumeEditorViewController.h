//
//  ResumeEditorViewController.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STBaseViewController.h"
#import "STUIButtonDay.h"
#import "STImagePicker.h"
#import "SessionInfo.h"
#import "UIViewController+ECSlidingViewController.h"

@interface ResumeEditorViewController : STBaseViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, ECSlidingViewControllerDelegate>

@property(nonatomic, weak) IBOutlet UIButton *btnAddPic;
@property(nonatomic, weak) IBOutlet UIButton *btnAddVideo;
@property(nonatomic, weak) IBOutlet UIButton *btnAddResume;

@property(nonatomic, weak) IBOutlet STUIButtonDay *btnMon;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnTue;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnWed;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnThu;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnFri;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnSat;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnSun;

@property(nonatomic, weak) IBOutlet UILabel *lblFullname;
@property(nonatomic, weak) IBOutlet UILabel *lblSummary;

@property(nonatomic, weak) IBOutlet UITextField *tfSummary;
@property(nonatomic, weak) IBOutlet UITextField *tfJobTitle;
@property(nonatomic, weak) IBOutlet UITextField *tfLanguages;
@property(nonatomic, weak) IBOutlet UITextField *tfSkillsets;

@property(nonatomic, weak) IBOutlet UIImageView *imgProfile;

@end
