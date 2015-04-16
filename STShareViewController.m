//
//  STShareViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/17/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STShareViewController.h"

@interface STShareViewController ()

@end

@implementation STShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    self.messagesTextView.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void) viewWillAppear:(BOOL)animated
{
    
}

-(void) setUpUI
{
    [self setUpBackButton];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setTitle:@"Share"];
    

    
    [self.messagesTextView.layer setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1].CGColor];
    [self.messagesTextView.layer setBorderWidth:1];
    [self.messagesTextView.layer setCornerRadius:5];
    self.messagesTextView.clipsToBounds = YES;
    
    [self addInputAccessoryViewForTextView:self.messagesTextView];
    [self addInputAccessoryViewForTextEdit:self.toTextField];

    
}

- (void)setUpBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 34, 33)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"left_arrow.png"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *barBackButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(popCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barBackButtonItem;
    self.navigationItem.hidesBackButton = YES;
}

- (void)popCurrentViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    
}


- (void)addInputAccessoryViewForTextView:(UITextView *)textView{
    
    //Create the toolbar for the inputAccessoryView
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [toolbar sizeToFit];
    toolbar.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //Add the done button and set its target:action: to call the method returnTextView:
    toolbar.items = [NSArray arrayWithObjects:
                     [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(focusToTextField)],flexibleSpace,
                     [[UIBarButtonItem alloc]initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(returnTextView)],
                     nil];
    
    //Set the inputAccessoryView
    [textView setInputAccessoryView:toolbar];
}



-(void) addInputAccessoryViewForTextEdit: (UITextField *) textEdit
{
    //Create the toolbar for the inputAccessoryView
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [toolbar sizeToFit];
    toolbar.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //Add the done button and set its target:action: to call the method returnTextView:
    toolbar.items = [NSArray arrayWithObjects:
                     [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(returnKeyboardFromTextField)],flexibleSpace,
                     [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(focusMessagesTextView)],
                     nil];
    
    //Set the inputAccessoryView
    [textEdit setInputAccessoryView:toolbar];
}

#pragma mark - TextView EdtiText methods
-(void) focusMessagesTextView
{
    [self.messagesTextView becomeFirstResponder];
}

-(void) focusToTextField
{
    [self.toTextField becomeFirstResponder];
}

-(void) returnKeyboardFromTextField {
    [self.toTextField resignFirstResponder];
}

-(void) returnTextView
{
    [self.messagesTextView resignFirstResponder];
    
    UIAlertView *message = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Your messages had been sent." delegate:nil cancelButtonTitle:@"Okie!" otherButtonTitles: nil];
    [message show];
    
}


#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
//    [self animateTextField: self.messagesTextView up : NO];

}

-(void)textViewDidEndEditing:(UITextView *)textView
{
//    [self animateTextField: self.messagesTextView up : NO];
}

#pragma mark - UI animation methods

-(void) animateTextField: (UITextView *) textField up: (BOOL) up
{
    const int movementDistance = 100; // teak as needed
    const float movementDuration = 0.3f; //tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations:@"anim" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}

- (void)actionShare:(UIActivityCategory *)category
{
    NSURL *linkURL = [NSURL URLWithString:@"http://www.swiftaskr.com"];
    NSMutableAttributedString *stringText = [[NSMutableAttributedString alloc] initWithString:@"Swiftaskr"];
    [stringText addAttribute:NSLinkAttributeName value:linkURL range:NSMakeRange(0, stringText.length)];
    NSArray *objectsToShare = @[stringText, linkURL];
    UIActivityViewController * AVC = [[UIActivityViewController alloc] initWithActivityItems:[[NSArray alloc] initWithObjects:objectsToShare, nil] applicationActivities:nil];
    
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    if ([currSysVer compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending) {
        AVC.popoverPresentationController.sourceView = self.view;
    }
    
    [self presentViewController:AVC animated:YES completion:nil];
}

@end
