//
//  STShareViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STShareViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *toTextField;


@property (strong, nonatomic) IBOutlet UITextView *messagesTextView;

- (IBAction)addButtonPressed:(UIButton *)sender;

@end
