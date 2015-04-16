//
//  STMenuViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ECSlidingViewController.h"


@interface STMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *closeMenuButton;
@property (strong, nonatomic) IBOutlet UIButton *settingMenu;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIView *profilePicView;

@property (strong, nonatomic) IBOutlet UILabel *profileName;
@property (strong, nonatomic) IBOutlet UILabel *profileCity;

@property (strong, nonatomic) IBOutlet UIImageView *menuImage;

@end
