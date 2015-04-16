//
//  STUploadVideoViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STUploadVideoViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface STUploadVideoViewController ()

@end

@implementation STUploadVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUPMenuButton];
    [self setUpUI];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void) setUpUI
{
    self.title = @"Upload Video";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [self colorWithHexString:@"37AD96"]}];
    self.navigationController.navigationBar.translucent = NO;
    
    [self.uploadVideoView setHidden:NO];
    [self.takeVideoView setHidden:NO];
    [self.uploadCompletedView setHidden:YES];
    
   
    
    [self.uploadVideoButton setBackgroundImage:[UIImage imageNamed:@"add 2"] forState:UIControlStateNormal];
    [self.uploadVideoButton addTarget:self action:@selector(uploadVideoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.takeVideoButton setBackgroundImage:[UIImage imageNamed:@"video137"] forState:UIControlStateNormal];
    [self.takeVideoButton addTarget:self action:@selector(takeVideoButtonPressed) forControlEvents:UIControlEventTouchUpInside];

    
}

-(void) setUPMenuButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 15, 22)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    
    
    UIBarButtonItem *barBackButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = barBackButton;
    self.navigationItem.hidesBackButton = YES;
}


#pragma mark - Methods

-(void) backButtonPressed
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) takeVideoButtonPressed
{
    NSLog(@"Take video clicked");
}

-(void) uploadVideoButtonPressed
{
    [self.uploadVideoView setHidden:YES];
    [self.takeVideoView setHidden:YES];
    [self.uploadCompletedView setHidden:NO];
    
    UIImage *image = [UIImage imageNamed:@"Henry.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    
    
    UIButton *playButton = [[UIButton alloc]initWithFrame:CGRectMake(40, 40, 120, 120)];
    [playButton setBackgroundImage:[UIImage imageNamed:@"playBtn"] forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(playButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.uploadCompletedView.layer setBorderWidth:3];
    [self.uploadCompletedView.layer setBorderColor:[self colorWithHexString:@"37AD96"].CGColor];
    self.uploadCompletedView.layer.cornerRadius = self.uploadCompletedView.frame.size.width / 2;
    [self.uploadCompletedView setBackgroundColor:[UIColor blackColor]];
    
    [self.uploadCompletedView addSubview:imageView];
    [self.uploadCompletedView addSubview:playButton];
 
}

-(void) playButtonPressed
{
    NSLog(@"Play Button clicked");
}


#pragma mark - Helper
-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


@end
