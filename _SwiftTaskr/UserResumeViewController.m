//
//  UserResumeViewController.m
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "UserResumeViewController.h"

@interface UserResumeViewController ()
{
    NSArray *btnAvailability;
}

@end

@implementation UserResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI
{
    btnAvailability = [[NSArray alloc] initWithObjects:self.btnMon, self.btnTue, self.btnWed, self.btnThu, self.btnFri, self.btnSat, self.btnSun, nil];
    
    Resume *tResume = [[SessionInfo getSharedInstance] getResume];
    
    self.ivProfile.image = [UIImage imageWithData:tResume.profileImg];
    self.tfSummary.text = tResume.summary;
    self.tfJobTitle.text = tResume.jobTitle;
    self.tfLangues.text = tResume.languages;
    self.tfSkillsets.text = tResume.skillsets;
    
    for(int i = 0; i < [btnAvailability count]; i++) {
        UIButton *tBtn = [btnAvailability objectAtIndex:i];
        BOOL flag = [[tResume.availability objectAtIndex:i] boolValue];
        
        [tBtn setSelected:flag];
    }
    
    [self.btnEditResume addTarget:self action:@selector(actionEditResume) forControlEvents:UIControlEventTouchUpInside];
    
    [self setUpBackButton];
}

- (void)actionEditResume
{
    [self gotoView:@"ResumeEditorView"];
}

-(void) setUpBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 22, 22)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"menu_green"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *barBackButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = barBackButton;
    self.navigationItem.hidesBackButton = YES;
}

- (void)backButtonPressed
{
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
    
}

@end
