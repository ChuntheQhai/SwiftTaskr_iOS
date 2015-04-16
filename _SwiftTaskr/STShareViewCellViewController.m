//
//  STShareViewCellViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STShareViewCellViewController.h"

@interface STShareViewCellViewController ()

@end

@implementation STShareViewCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUPMenuButton];
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setUpUI
{
    
    [self.shareMessage setBackgroundColor:[self colorWithHexString:@"37AD96"]];
    [self.shareMessage.layer setCornerRadius:5.0];
//    [self.shareTweet setBackgroundColor:[self colorWithHexString:@"37AD96"]];
//    [self.shareTweet.layer setCornerRadius:5.0];
//    [self.shareFacebook setBackgroundColor:[self colorWithHexString:@"37AD96"]];
//    [self.shareFacebook.layer setCornerRadius:5.0];
//    [self.shareEmail setBackgroundColor:[self colorWithHexString:@"37AD96"]];
//    [self.shareEmail.layer setCornerRadius:5.0];
    
    [self.shareMessage addTarget:self action:@selector(shareMessagePressed) forControlEvents:UIControlEventTouchUpInside];
//    [self.shareTweet addTarget:self action:@selector(shareTweetPressed) forControlEvents:UIControlEventTouchUpInside];
//    [self.shareFacebook addTarget:self action:@selector(shareFacebookPressed) forControlEvents:UIControlEventTouchUpInside];
//    [self.shareEmail addTarget:self action:@selector(shareEmailPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
}

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

- (void)actionShare
{
    NSURL *linkURL = [NSURL URLWithString:@"http://www.swiftaskr.com"];
    NSMutableAttributedString *stringText = [[NSMutableAttributedString alloc] initWithString:@"Swiftaskr"];
    [stringText addAttribute:NSLinkAttributeName value:linkURL range:NSMakeRange(0, stringText.length)];
    NSArray *objectsToShare = @[stringText, linkURL];
    UIActivityViewController * AVC = [[UIActivityViewController alloc] initWithActivityItems:[[NSArray alloc] initWithObjects:objectsToShare, nil] applicationActivities:nil];
    
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    if ([currSysVer compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending) {
        AVC.popoverPresentationController.sourceView = self.view;
    }
    
    [self presentViewController:AVC animated:YES completion:nil];
}

-(void) shareMessagePressed
{
    [self actionShare];
    NSLog(@"MESSAGE");
}

-(void) shareTweetPressed
{
    NSLog(@"TWEET");

}

-(void) shareFacebookPressed
{
    NSLog(@"FACEBOOK");

}

-(void) shareEmailPressed
{
    NSLog(@"EMAIL");

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
