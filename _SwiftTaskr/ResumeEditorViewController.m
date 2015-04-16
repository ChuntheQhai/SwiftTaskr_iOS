//
//  ResumeEditorViewController.m
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "ResumeEditorViewController.h"

@interface ResumeEditorViewController ()

@property(nonatomic, retain) NSArray *btnAvailabilities;
@property(nonatomic, retain) UIColor *colorActive;
@property(nonatomic, retain) UIColor *colorInactive;

@property(nonatomic, strong) STImagePicker *imgPicker;

@end

@implementation ResumeEditorViewController

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
    _colorActive = [UIColor colorWithRed:41/255 green:187/255 blue:156/255 alpha:1];
    _colorInactive = [UIColor colorWithRed:198/255 green:238/255 blue:230/255 alpha:1];
    
    _imgPicker = [[STImagePicker alloc] init];
    _imgPicker.parentViewController = self;
    
    [self.btnAddPic addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnAddVideo addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnAddResume addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnMon addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnTue addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnWed addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnThu addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnFri addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnSat addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnSun addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _btnAvailabilities = [[NSArray alloc] initWithObjects:self.btnMon, self.btnTue, self.btnWed, self.btnThu, self.btnFri, self.btnSat, self.btnSun, nil];
    
    UserInfo *tUser = [[SessionInfo getSharedInstance] getUserInfo];
    
    [self.lblFullname setText:tUser.fullname];
    [self.lblSummary setText:[NSString stringWithFormat:@"%zd | %@", tUser.age, tUser.occupation]];
    
    [self.btnAddResume addTarget:self action:@selector(actionSave) forControlEvents:UIControlEventTouchUpInside];
    
    [self setUPMenuButton];
    
    [self.btnAddResume setTitle:@"Update resume" forState:UIControlStateNormal];
    
    Resume *tResume = [[SessionInfo getSharedInstance] getResume];
    
    if( tResume.profileImg != nil ) {
        self.imgProfile.image = [UIImage imageWithData:tResume.profileImg];
        [self.imgProfile setAlpha:1.0];
    }
    
    self.tfSummary.text = tResume.summary;
    self.tfJobTitle.text = tResume.jobTitle;
    self.tfLanguages.text = tResume.skillsets;
    self.tfSkillsets.text = tResume.skillsets;
    
}

- (void)actionBtnClick:(UIButton *)sender
{
    if( sender == self.btnAddPic ) {
        [_imgPicker showInView:[UIApplication sharedApplication].keyWindow];
        
    } else if ( sender == self.btnAddVideo ) {
        
        
    } else if ( sender == self.btnAddResume ) {
        
        
    } else if ( [sender isKindOfClass:[STUIButtonDay class]] )  {
        [sender setSelected:!sender.isSelected];
        
    } else {
        NSLog(@"sender is not found");
        
    }
}

#pragma Image Picker


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    
    self.imgProfile.image = img;
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.imgProfile setAlpha:1.0];
        
    }];
    
}

- (void)actionSave
{
    Resume *resume = [[Resume alloc] init];
    
    resume.profileImg = UIImageJPEGRepresentation(self.imgProfile.image, 1);
    resume.summary = self.tfSummary.text;
    resume.jobTitle = self.tfJobTitle.text;
    resume.languages = self.tfLanguages.text;
    resume.skillsets = self.tfSkillsets.text;
    
    NSMutableArray *availability = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [_btnAvailabilities count]; i++) {
        UIButton *tBtn = [_btnAvailabilities objectAtIndex:i];
        
        if( tBtn.isSelected ) {
            [availability addObject:[NSNumber numberWithBool:YES]];
            
        } else {
            [availability addObject:[NSNumber numberWithBool:NO]];
            
        }
        
    }
    
    resume.availability = availability;
    
    [[SessionInfo getSharedInstance] setResume:resume];
    
    [self gotoView:@"ResumeViewerView"];
}

-(void) setUPMenuButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 15, 22)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    
    
    UIBarButtonItem *barBackButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(menuButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = barBackButton;
    self.navigationItem.hidesBackButton = YES;
}

-(void) menuButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
