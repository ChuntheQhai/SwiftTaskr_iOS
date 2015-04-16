//
//  STMessengerViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STMessengerViewController.h"
#import "STMessageBoxViewController.h"
#import "STCustomCell.h"

@interface STMessengerViewController ()
{
    NSArray *profilePic;
    NSArray *profileName;
    NSArray *profileMessage;
}
@end

@implementation STMessengerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUPMenuButton];
    [self setUpUI];
    [self generateRawData];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
   
}

-(void) generateRawData
{
    profilePic = [[NSArray alloc]initWithObjects:@"giant.jpeg",@"starbucks.jpg",@"tesco.gif",nil];
    profileName = [[NSArray alloc] initWithObjects:@"Giant",@"Starbucks",@"Tesco", nil];
    profileMessage = [[NSArray alloc]initWithObjects:@"Barista",@"Promoter",@"Brand Ambassador", nil];
}

-(void) setUpUI
{
    self.title = @"Messages";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [self colorWithHexString:@"37AD96"]}];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

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

-(void) backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MessengerCell";
    STCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.messagePicture.image = [UIImage imageNamed:[profilePic objectAtIndex:indexPath.row]];
                                 
    cell.messageText.text = [profileMessage objectAtIndex:indexPath.row];
    cell.messageName.text = [profileName objectAtIndex:indexPath.row];
    
    [cell.profileView addSubview:[self convertIntoCircularImage:[UIImage imageNamed:[profilePic objectAtIndex:indexPath.row]]]];
    

    
    
       return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    STMessageBoxViewController *viewController = (STMessageBoxViewController *)[storyboard instantiateViewControllerWithIdentifier:@"STMessageBoxViewController"];
    
    viewController.receiverName = [profileName objectAtIndex:indexPath.row];
    viewController.receiverPic = [profilePic objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

#pragma mark - Helper
-(UIImageView *) convertIntoCircularImage : (UIImage *) image
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 55, 55);
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    
    return imageView;
    

}
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
