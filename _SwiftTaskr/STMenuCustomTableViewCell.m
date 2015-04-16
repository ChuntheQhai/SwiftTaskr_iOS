//
//  STMenuCustomTableViewCell.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STMenuCustomTableViewCell.h"

@interface STMenuCustomTableViewCell()
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSArray *menuIcons;
@property (nonatomic, strong) UINavigationController *transitionsNavigationController;
@end

@implementation STMenuCustomTableViewCell



- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        self.separatorInset = UIEdgeInsetsZero;
    }
}


@end
