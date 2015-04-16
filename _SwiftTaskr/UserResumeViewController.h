//
//  UserResumeViewController.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STBaseViewController.h"
#import "STUIButtonDay.h"
#import "SessionInfo.h"
#import "UIViewController+ECSlidingViewController.h"

@interface UserResumeViewController : STBaseViewController

@property(nonatomic, weak) IBOutlet UIImageView *ivProfile;
@property(nonatomic, weak) IBOutlet UILabel *tfSummary;
@property(nonatomic, weak) IBOutlet UILabel *tfJobTitle;
@property(nonatomic, weak) IBOutlet UILabel *tfLangues;
@property(nonatomic, weak) IBOutlet UILabel *tfSkillsets;

@property(nonatomic, weak) IBOutlet UIButton *btnEditResume;

@property(nonatomic, weak) IBOutlet STUIButtonDay *btnMon;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnTue;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnWed;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnThu;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnFri;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnSat;
@property(nonatomic, weak) IBOutlet STUIButtonDay *btnSun;

@end
