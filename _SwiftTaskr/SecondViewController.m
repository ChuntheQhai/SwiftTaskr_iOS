//
//  SecondViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "SecondViewController.h"
#import "STShareViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setUpUI
{
    self.viewContainer.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor;
    self.viewContainer.layer.borderWidth = 3.0f;
}


- (IBAction)moreButtonPressed:(UIButton *)sender {
}

- (IBAction)shareButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    STSendMessageViewController *viewController = (STSendMessageViewController *)[storyboard instantiateViewControllerWithIdentifier:@"STShareViewController"];

    [self.navigationController pushViewController:viewController animated:YES];
    

}


@end
