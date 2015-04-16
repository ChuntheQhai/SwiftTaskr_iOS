//
//  JobCardTableViewCell.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobCardTableViewCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UIView *viewContainer;
@property(nonatomic, weak) IBOutlet UIImageView *background;
@property(nonatomic, weak) IBOutlet UILabel *lblMinAgo;
@property(nonatomic, weak) IBOutlet UILabel *lblLocation;
@property(nonatomic, weak) IBOutlet UILabel *lblJobTItle;
@property(nonatomic, weak) IBOutlet UILabel *lblJobDate;
@property(nonatomic, weak) IBOutlet UILabel *lblJobPay;
@property(nonatomic, weak) IBOutlet UILabel *lblDesc;

@end
