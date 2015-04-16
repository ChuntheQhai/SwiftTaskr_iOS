//
//  SelectionPickerView.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STBaseViewController.h"
#import "SelectionItem.h"

@protocol SelectionPickerDelegate;

@interface SelectionPickerView : STBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, weak) id<SelectionPickerDelegate>delegate;
@property(nonatomic, weak) UITableView *tableView;

- (void)setDataSource:(NSArray *)dataSource;
- (void)setAllowMultipleSelection:(BOOL)flag;
- (void)setSelectedIndex:(NSInteger)index;
- (void)setSelectedValue:(NSString *)value;
- (void)show;

@end
