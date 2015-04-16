//
//  STShareViewCellViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ECSlidingViewController.h"


@interface STShareViewCellViewController : UIViewController <ECSlidingViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *shareMessage;

@end
