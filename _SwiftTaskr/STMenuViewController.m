//
//  STMenuViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STMenuViewController.h"
#import "STMenuCustomTableViewCell.h"
#import <QuartzCore/QuartzCore.h>


@interface STMenuViewController ()
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSArray *menuIcons;
@property (nonatomic, strong) UINavigationController *transitionsNavigationController;
@end

@implementation STMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self setUpUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"STGreenColorView"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) setUpUI
{
    /** CUSTOMIZE PROFILE PIC VIEW **/
    UIImage *image = [UIImage imageNamed:@"Henry.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, self.profilePicView.frame.size.width, self.profilePicView.frame.size.height);
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    self.profilePicView.layer.cornerRadius = self.profilePicView.frame.size.width / 2;
    [self.profilePicView addSubview:imageView];
    
    /** RESIZE UIIMAGE **/
    UIImage *closeImage = [UIImage imageNamed:@"cancel.png"];
    CGSize sacleSize = CGSizeMake(10, 20);
    UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
    [closeImage drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
    UIImage * resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *settingImage = [UIImage imageNamed:@"setting.png"];
    CGSize scaleSize = CGSizeMake(10, 20);
    UIGraphicsBeginImageContextWithOptions(scaleSize, NO, 0.0);
    [settingImage drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage * resizedSetting = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.closeMenuButton setBackgroundImage:resizedImage forState:UIControlStateNormal];
    [self.closeMenuButton addTarget:self action:@selector(closeMenuButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.settingMenu setBackgroundImage:resizedSetting forState:UIControlStateNormal];

}

-(void) closeMenuButtonPressed
{
    self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"STHomeNavigationController"];

    [self.slidingViewController resetTopViewAnimated:YES];
}

#pragma mark - Properties
- (NSArray *)menuItems {
    if (_menuItems) return _menuItems;
    
    _menuItems = @[@"Home", @"Profile",@"Notification",@"Share",@"Feedback",@""];
    
    return _menuItems;
}

- (NSArray *) menuIcons{
    if(_menuIcons) return _menuIcons;
    
    _menuIcons = @[@"Home 3",@"User 4",@"notification",@"share",@"feedback",@""];
    
    return _menuIcons;
}


#pragma mark - UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 77;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MenuCell";
    STMenuCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    cell.cellView.center = CGPointMake(cell.contentView.bounds.size.width/2.5, cell.contentView.bounds.size.height/2);
    
    NSString *menuItem = self.menuItems[indexPath.row];
    NSString *menuIcons = self.menuIcons[indexPath.row];
    
    cell.menuName.text = menuItem;
    cell.menuImage.image = [UIImage imageNamed:menuIcons];
    if(indexPath.row == 5){
        [cell.menuImage removeFromSuperview];
        cell.menuName.text = @"Recruiter Mode";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        
        //Create switchView object
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        
        
        [switchView setOnTintColor:[self colorWithHexString:@"000000"]];
        [switchView setTintColor:[self colorWithHexString:@"37AD96"]];
        [switchView setThumbTintColor:[self colorWithHexString:@"37AD96"]];
        //Resize the switchView
        switchView.transform = CGAffineTransformMakeScale(1.20, 1.2);
        
        //Add switchView into cellView
        [cell.cellView addSubview:switchView];
        
        //Center the switchView to cellView
        switchView.center = CGPointMake(cell.cellView.bounds.size.width/6, cell.cellView.bounds.size.height/2);
        
        [switchView setOn: NO animated:NO];
        [switchView addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        
    }
    return cell;
}

-(void) switchChanged : (id) sender
{
    UISwitch* switchControl = sender;
    NSLog( @"The switch is %@", switchControl.on ? @"ON" : @"OFF" );
}

#pragma mark - UITableViewDelegate
-(BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.row)
    {
        case 0:
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"STHomeNavigationController"];
            [self.slidingViewController resetTopViewAnimated:YES];

            break;
        case 1:
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UserProfileNavigation"];

            [self.slidingViewController resetTopViewAnimated:YES];
            
            break;
        case 2:
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"STHomeNavigationController"];
            
            [self.slidingViewController resetTopViewAnimated:YES];


            break;
        case 3:
            
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"STShareViewCellNavigationController"];
            [self.slidingViewController resetTopViewAnimated:YES];

            break;
        case 4:
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"STHomeNavigationController"];
            [self.slidingViewController resetTopViewAnimated:YES];
            break;
        case 5:
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"STHomeNavigationController"];
            [self.slidingViewController resetTopViewAnimated:YES];
            break;
    }
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
