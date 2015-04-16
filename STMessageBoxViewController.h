//
//  STMessageBoxViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/18/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMBubbleTableViewController.h"


@interface STMessageBoxViewController : AMBubbleTableViewController


@property (nonatomic, strong) NSString *receiverName;
@property (nonatomic, strong) NSString *receiverPic;

@end
