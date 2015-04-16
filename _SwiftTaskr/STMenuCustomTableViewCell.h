//
//  STMenuCustomTableViewCell.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STMenuCustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *menuImage;
@property (strong, nonatomic) IBOutlet UILabel *menuName;
@property (strong, nonatomic) IBOutlet UIView *cellView;

@end
