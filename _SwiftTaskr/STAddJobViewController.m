//
//  STAddJobViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STAddJobViewController.h"
#import "STAddJobCustomCell.h"
#import "UIImage+Resize.h"


@interface STAddJobViewController ()
@property(nonatomic, strong, readwrite) PayPalConfiguration *payPalConfig;

@end

@implementation STAddJobViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBackButton];
    [self setUpPaypalConfiguration];
    [self setUpUI];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.textFieldCompanyName.delegate = self;
    self.textFieldEmail.delegate = self;
    self.textFieldTitle.delegate = self;
    self.topCriteria.delegate = self;
    self.descriptionTextView.delegate =self;
    _selectedCandidate = @" ";
    
    NSDate *pickerDate = self.datePicker.date;
    NSTimeZone *pickerTime = self.datePicker.timeZone;
    
    NSLog(@"%@",pickerDate);
    NSLog(@"%@",pickerTime);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void) setUpUI
{
    //Customize Navigation Controller
    self.title = @"Tele-marketing";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [self colorWithHexString:@"37AD96"]}];
    self.navigationController.navigationBar.translucent = NO;
    
    [self addInputAccessoryViewForTextEdit:self.textFieldCompanyName];
    [self addInputAccessoryViewForTextEdit:self.textFieldTitle];
    [self addInputAccessoryViewForTextEdit:self.textFieldEmail];
    [self addInputAccessoryViewForTextEdit:self.topCriteria];
    [self addInputAccessoryViewForTextView:self.descriptionTextView];
    

    
    
    [self.addPhotoButton setBackgroundImage:[UIImage imageNamed:@"add 2"] forState:UIControlStateNormal];
    [self.addPhotoButton addTarget:self action:@selector(addPhotoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
     [self.textFieldCompanyName setBorderStyle:UITextBorderStyleNone];
    [self.textFieldTitle setBorderStyle:UITextBorderStyleNone];
    [self.textFieldEmail setBorderStyle:UITextBorderStyleNone];

    
    [self.seekBar setThumbImage:[UIImage imageNamed:@"thumb"] forState:UIControlStateNormal];
    [self.seekBar setThumbTintColor:[self colorWithHexString:@"37AD96"]];
    [self.seekBar setTintColor:[self colorWithHexString:@"37AD96"]];
    
    
    [self.addPayButton setTitle:@"+" forState:UIControlStateNormal];
    [self.addPayButton setTitleColor:[self colorWithHexString:@"0000000"] forState:UIControlStateNormal];
    self.addPayButton.font = [UIFont systemFontOfSize:44];
    [self.addPayButton addTarget:self action:@selector(addPayAmount) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.minusPayButton setTitle:@"-" forState:UIControlStateNormal];
    [self.minusPayButton setTitleColor:[self colorWithHexString:@"0000000"] forState:UIControlStateNormal];
    self.minusPayButton.font = [UIFont systemFontOfSize:44];
    [self.minusPayButton addTarget:self action:@selector(minusPayAmount) forControlEvents:UIControlEventTouchUpInside];
    
    self.seekBar.minimumValue = 0.0f;
    self.seekBar.maximumValue = 100.0f;
    self.seekBar.continuous = YES;
    self.seekBar.value = 20.0;
    self.maxDollarLabel.text = @"20";
    
    
    [self.topCriteria.layer setBorderColor:[self colorWithHexString:@"37AD96"].CGColor];
    [self.topCriteria.layer setBorderWidth:1];
    [self.topCriteria.layer setCornerRadius:5];
    self.topCriteria.clipsToBounds = YES;
    
    
    [self.descriptionTextView.layer setBorderColor:[self colorWithHexString:@"37AD96"].CGColor];
    [self.descriptionTextView.layer setBorderWidth:1];
    [self.descriptionTextView.layer setCornerRadius:5];
    self.descriptionTextView.clipsToBounds = YES;
    [self.descriptionTextView setTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
    
   
    [self.nextButton setBackgroundColor:[self colorWithHexString:@"37AD96"]];
    [self.nextButton.layer setCornerRadius:5.0];
    [self.nextButton addTarget:self action:@selector(nextButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    //SetUp PaypayButton
    UIImage *logoImage = [UIImage imageWithImage:[UIImage imageNamed:@"paypal_icon"] scaledToSize:CGSizeMake(25, 25)];
    [self.paypayButton.titleLabel setFont:[UIFont fontWithName:@"Verdana-BoldItalic" size:18.0]];
    [self.paypayButton setImage:logoImage forState:UIControlStateNormal];
    self.paypayButton.adjustsImageWhenHighlighted = NO;
    [self.paypayButton setBackgroundColor:[self colorWithHexString:@"189ad6"]];
    [self.paypayButton.layer setCornerRadius:7.5];
    [self.paypayButton setTitle:@"Pay with Paypal" forState:UIControlStateNormal];
    [self.paypayButton addTarget:self action:@selector(payNowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.paypalSuccessView setHidden:YES];
    [self.nextButton setHidden:YES];
    
    CGRect tFrame = self.svMain.frame;
    tFrame.size.height = self.view.frame.size.height;
    self.svMain.frame = tFrame;
    
    [self.svMain setContentSize:CGSizeMake(375, 1100)];
}



#pragma mark - Methods
-(void) setUpBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 15, 22)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *barBackButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = barBackButton;
    self.navigationItem.hidesBackButton = YES;
}

-(void) backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) addPhotoButtonPressed
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentModalViewController:imagePickerController animated:YES];
}

-(void) nextButtonPressed
{
    
    NSDate *myDate = self.datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"hh:mm:ss"];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
   
    NSString *date = [dateFormatter stringFromDate:myDate];
    NSString *time = [timeFormatter stringFromDate:myDate];
    
    JobOffer *jobOffer = [[JobOffer alloc] init];
    
    jobOffer.jobImg = UIImageJPEGRepresentation(self.uploadedPicture.image, 1);
    jobOffer.title = self.textFieldTitle.text;
    jobOffer.email = self.textFieldEmail.text;
    jobOffer.address = self.textFieldCompanyName.text;
    jobOffer.desc = self.descriptionTextView.text;
    jobOffer.topCriteria = self.topCriteria.text;
    jobOffer.salary = self.seekBar.value;
//    
//    self.uploadedPicture.image =[UIImage imageWithData:jobOffer.jobImg];
//    self.textFieldTitle.text = jobOffer.title;
//    self.textFieldEmail.text = jobOffer.email;
//    self.textFieldCompanyName.text = jobOffer.address;
//    self.descriptionTextView.text = jobOffer.desc;
//    self.topCriteria.text = jobOffer.topCriteria;
//    
    NSLog(@"%@",date);
          
    
    date = [NSString stringWithFormat:@"%@",jobOffer.startDate];
    time = [NSString stringWithFormat:@"%@",jobOffer.startTime];
    
    
    [[SessionInfo getSharedInstance] addJobOffers:jobOffer];
    
    [self gotoView:@"HomeView"];
    
}

-(void) addPayAmount
{
    self.seekBar.value++;
     self.maxDollarLabel.text = [NSString stringWithFormat:@"%d", (int) self.seekBar.value];
}

-(void) minusPayAmount
{
    self.seekBar.value--;
    self.maxDollarLabel.text = [NSString stringWithFormat:@"%d", (int) self.seekBar.value];
}


-(IBAction)sliderMoved:(id)sender {
    UISlider *slider = (UISlider *)sender;
    self.maxDollarLabel.text = [NSString stringWithFormat:@"%d",(int)[slider value]];
    
    NSLog(@"SliderValue ... %d",(int)[slider value]);
}

- (IBAction)sliderValueChanged:(id)sender {
//    
//    CGFloat value = sender.value;
//    CGFloat adjustedValue = sender.maximumValue - value + sender.minimumValue;
    
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.uploadedPicture.image = image;
    self.uploadedPicture.alpha = 1;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - UITableDataSrouce

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CandidateCell";
    STAddJobCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.resultCandidate.text = _selectedCandidate;
    
    return cell;
}

#pragma mark - UITableDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    STCandidateTableViewController *viewController = (STCandidateTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"STCandidateTableViewController"];
    viewController.delegate = self;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

#pragma mark - Helper
-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

#pragma mark - Add Input Accessory into Keyboard

-(void) addInputAccessoryViewForTextEdit: (UITextField *) textEdit
{
    //Create the toolbar for the inputAccessoryView
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [toolbar sizeToFit];
    toolbar.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    if (textEdit == self.textFieldCompanyName) {
        //Add the done button and set its target:action: to call the method returnTextView:
        toolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(returnKeyboardFromCompanyField)],flexibleSpace,
                         [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(focusEmailField)],
                         nil];
    }
    else if (textEdit == self.textFieldEmail)
    {
        //Add the done button and set its target:action: to call the method returnTextView:
        toolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(focusCompanyField)],flexibleSpace,
                         [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(focusTitleField)],
                         nil];
    }
    else if (textEdit == self.textFieldTitle)
    {
        //Add the done button and set its target:action: to call the method returnTextView:
        toolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(focusEmailField)],flexibleSpace,
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(returnKeyboardFromTextFieldTitle)],
                         nil];
    }
    else if (textEdit == self.topCriteria)
    {
        //Add the done button and set its target:action: to call the method returnTextView:
        toolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(returnKeyboardFromCriteria)],flexibleSpace,
                         [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(focusDecription)],
                         nil];
    }

    //Set the inputAccessoryView
    [textEdit setInputAccessoryView:toolbar];
}

-(void) addInputAccessoryViewForTextView: (UITextView *) textView
{
    //Create the toolbar for the inputAccessoryView
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [toolbar sizeToFit];
    toolbar.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
   
        toolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithTitle:@"Previous" style:UIBarButtonItemStyleDone target:self action:@selector(foucsTopCriteria)],flexibleSpace,
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(returnKeyboardFromDescription)],
                         nil];
    
    //Set the inputAccessoryView
    [textView setInputAccessoryView:toolbar];
}



-(void) returnKeyboardFromCriteria
{
    [self.topCriteria resignFirstResponder];
}
-(void) focusDecription
{
    [self.descriptionTextView becomeFirstResponder];
}

-(void) foucsTopCriteria
{
    [self.topCriteria becomeFirstResponder];
}

-(void) returnKeyboardFromDescription
{
    [self.descriptionTextView resignFirstResponder];
}

-(void) returnKeyboardFromCompanyField
{
    [self.textFieldCompanyName resignFirstResponder];
}

-(void) returnKeyboardFromTextFieldTitle
{
    [self.textFieldTitle resignFirstResponder];
}

-(void) focusCompanyField
{
    [self.textFieldCompanyName becomeFirstResponder];
}

-(void) focusEmailField
{
    [self.textFieldEmail becomeFirstResponder];
}

-(void) focusTitleField
{
    [self.textFieldTitle becomeFirstResponder];
}



#pragma mark - UI animation methods

-(void) animateTextField: (UITextField *) textField up: (BOOL) up
{
    if(textField == self.topCriteria)
    {
        const int movementDistance = 160; // teak as needed
        const float movementDuration = 0.3f; //tweak as needed
        int movement = (up ? -movementDistance : movementDistance);
        
        [UIView beginAnimations:@"anim" context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    }
    else {
        const int movementDistance = 160; // teak as needed
        const float movementDuration = 0.3f; //tweak as needed
        int movement = (up ? -movementDistance : movementDistance);
    
        [UIView beginAnimations:@"anim" context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    }
    [UIView commitAnimations];
}

-(void) animateTextView :(UITextView *) textView
                    up  : (BOOL) up
{
    const int movementDistance = -220; // teak as needed
    const float movementDuration = 0.3f; //tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations:@"anim" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up : YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    
    if([textView.text isEqualToString:@"Description"])
        textView.text = @"";
    
    textView.textColor = [UIColor blackColor];
    [self animateTextView:textView up:NO];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self animateTextView:textView up:YES];
}

-(void)textViewDidChange:(UITextView *)textView
{
    if(self.descriptionTextView.text.length == 0){
        self.descriptionTextView.textColor = [UIColor lightGrayColor];
        self.descriptionTextView.text = @"Description";
        [self.descriptionTextView resignFirstResponder];
    }
}

- (void)onDismiss:(NSString *)value
{
    _selectedCandidate = value;
    [self.tableView reloadData];
}


#pragma mark - Paypal Configurations
-(void) setUpPaypalConfiguration
{
    // Set up payPalConfig
    _payPalConfig = [[PayPalConfiguration alloc] init];
    _payPalConfig.acceptCreditCards = YES;
    _payPalConfig.merchantName = @"Awesome Shirts, Inc.";
    _payPalConfig.merchantPrivacyPolicyURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/privacy-full"];
    _payPalConfig.merchantUserAgreementURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/useragreement-full"];
}

- (IBAction)payNowButton:(UIButton *)sender {
    NSString *price = _selectedCandidate;
    
    NSDecimalNumber *amount = [[NSDecimalNumber alloc] initWithString:price];
    PayPalPayment *payment = [[PayPalPayment alloc]init];
    payment.amount = amount;
    payment.currencyCode = @"SGD";
    
    NSMutableString *firstString = [[NSMutableString alloc]initWithString:@""];
    [firstString appendString:price];
    payment.shortDescription = firstString;
    payment.items = nil;
    payment.paymentDetails = nil;
    
    //Update Paypal Config re-accepting credits cards
    self.payPalConfig.acceptCreditCards = self.acceptCreditCards;
    
    PayPalPaymentViewController *paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment configuration:self.payPalConfig delegate:self];
    [self presentViewController:paymentViewController animated:YES completion:nil];
}

#pragma mark - PayPalPaymentDelegate methods
-(void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController didCompletePayment:(PayPalPayment *)completedPayment
{
    NSLog(@"Paypal payment success");
    self.resultText = [completedPayment description];
    [self.paypalSuccessView setHidden:NO];
    [self.nextButton setHidden:NO];
    [self.paypayButton setHidden:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController
{
    NSLog(@"Paypal Payment Canceled");
    self.resultText = nil;
//    self.successView.hidden = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
