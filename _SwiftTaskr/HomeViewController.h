//
//  HomeViewController.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STBaseViewController.h"
#import "iCarousel.h"
#import "SessionInfo.h"
#import "UIViewController+ECSlidingViewController.h"


@interface HomeViewController : STBaseViewController <UIGestureRecognizerDelegate,ECSlidingViewControllerDelegate>

@property(nonatomic, weak) IBOutlet UIImageView *imgProfile;

@property(nonatomic, weak) IBOutlet UILabel *lblWelcome;
@property(nonatomic, weak) IBOutlet UILabel *lblLocation;

@property(nonatomic, strong) IBOutlet iCarousel *viewCarousel;
@property(nonatomic, weak) IBOutlet UIView *viewPlaceholder;

@property(nonatomic, weak) IBOutlet NSLayoutConstraint *csTop;

@end
