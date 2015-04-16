//
//  STAddJobViewController.h
//  _SwiftTaskr
//
//  Created by ChunQhai on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STBaseViewController.h"
#import "STCandidateTableViewController.h"
#import "JobOffer.h"
#import "SessionInfo.h"
#import "PayPalMobile.h"



@interface STAddJobViewController : STBaseViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate, STCandidateTableDelegate,PayPalPaymentDelegate,UIPopoverControllerDelegate>

@property (strong, nonatomic) NSString *selectedCandidate;
@property (strong, nonatomic) IBOutlet UIImageView *uploadedPicture;
@property (strong, nonatomic) IBOutlet UIButton *addPhotoButton;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCompanyName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (strong, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UISlider *seekBar;
@property (strong, nonatomic) IBOutlet UILabel *maxDollarLabel;
@property (strong, nonatomic) IBOutlet UIButton *addPayButton;
@property (strong, nonatomic) IBOutlet UIButton *minusPayButton;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UITextField *topCriteria;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIButton *paypayButton;


#pragma mark - For Paypal
@property (strong, nonatomic) IBOutlet UIView *paypalSuccessView;
@property (nonatomic, strong, readwrite) NSString *environment;
@property (nonatomic,assign, readwrite) BOOL acceptCreditCards;
@property (nonatomic, strong, readwrite) NSString *resultText;

- (IBAction)sliderValueChanged:(id)sender;


@end
