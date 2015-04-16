//
//  STTarBarViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STTarBarViewController.h"

@interface STTarBarViewController ()

@end

@implementation STTarBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUPMenuButton];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//- (IBAction)menuButtonPressed:(id)sender {
//
//}

-(void) setUPMenuButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 22, 22)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"menu_green"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    
    
    UIBarButtonItem *barBackButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(menuButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = barBackButton;
    self.navigationItem.hidesBackButton = YES;
}

-(void) menuButtonPressed
{
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}


@end
