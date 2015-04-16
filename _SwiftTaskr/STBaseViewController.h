//
//  STBaseViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/21/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBaseViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UIScrollView *svMain;
@property(nonatomic, weak) UITextField *activeField;

-(void) gotoView : (NSString *)storyBoardId;
-(UIColor*)colorWithHexString:(NSString*)hex;

@end
