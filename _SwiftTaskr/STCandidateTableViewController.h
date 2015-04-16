//
//  STCandidateTableViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol STCandidateTableDelegate;

@interface STCandidateTableViewController : UITableViewController

@property(nonatomic, weak) id<STCandidateTableDelegate> delegate;
@property (strong, nonatomic) NSString *result;

@end

@protocol STCandidateTableDelegate <NSObject>

-(void)onDismiss:(NSString *)value;

@end