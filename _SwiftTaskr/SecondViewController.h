//
//  SecondViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *shareButtonPressed;


@property (strong, nonatomic) IBOutlet UIView *viewContainer;
@property (strong, nonatomic) IBOutlet UIImageView *imageHeader;


- (IBAction)moreButtonPressed:(UIButton *)sender;
- (IBAction)shareButtonPressed:(id)sender;

@end

