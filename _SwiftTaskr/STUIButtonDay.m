//
//  SFButtonDay.m
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STUIButtonDay.h"

@implementation STUIButtonDay

- (id)init
{
    self = [super init];
    
    if ( self ) {
        [self setupUI];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if ( self ) {
        [self setupUI];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if ( self ) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI
{
    _colorActive = [UIColor colorWithRed:41/255 green:187/255 blue:156/255 alpha:1];
    _colorInactive = [UIColor colorWithRed:198/255 green:238/255 blue:230/255 alpha:1];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
