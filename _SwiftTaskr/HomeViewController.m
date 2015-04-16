//
//  HomeViewController.m
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property(nonatomic, strong) UITapGestureRecognizer *tapPlaceholder;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupData
{
    
}

- (void)setupUI
{
    [self.imgProfile.layer setCornerRadius:50];
    [self.imgProfile setClipsToBounds:YES];
    
    //configure carousel
    [self.viewCarousel setVertical:YES];
    [self.viewCarousel setClipsToBounds:YES];
    [self.viewCarousel setType:iCarouselTypeLinear];
    
    [self.viewCarousel setAlpha:0];
    
    JobOffer *tJobOffer = (JobOffer *) [[[SessionInfo getSharedInstance] getJobOffers] objectAtIndex:0];
    UIView *tPlaceholderView = [self genCardView:tJobOffer];
    [self.viewPlaceholder addSubview:tPlaceholderView];
    
    CGRect tFrame = tPlaceholderView.frame;
    tFrame.origin.x = 20;
    tFrame.origin.y = (self.viewPlaceholder.frame.size.height - 150) / 2;
    tPlaceholderView.frame = tFrame;
    CGFloat tAlpha = 0.9;
    
    for( int i = 0; i < 5; i++) {
        UIView *fakeHeader = [[UIView alloc] initWithFrame:CGRectMake(tFrame.origin.x += 5, tFrame.origin.y -= 8, tFrame.size.width -= 10, 20)];
        [fakeHeader setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:tAlpha-=0.1]];
        [fakeHeader.layer setCornerRadius:2.5];
        [fakeHeader setClipsToBounds:YES];
        
        [self.viewPlaceholder addSubview:fakeHeader];
    }
    
    [self.viewPlaceholder bringSubviewToFront:tPlaceholderView];
    
    _tapPlaceholder = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionSingleTap:)];
    _tapPlaceholder.delegate = self;
    [self.viewPlaceholder addGestureRecognizer:_tapPlaceholder];
    
    [self setUPMenuButton];
}

-(void) setUPMenuButton
{
    self.title = @"HOME";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [self colorWithHexString:@"37AD96"]}];
    self.navigationController.navigationBar.translucent = NO;
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 22, 22)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"menu_green"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *barBackButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(menuButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnChat = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btnChat setImage:[UIImage imageNamed:@"Chat 2.png"] forState:UIControlStateNormal];
    [btnChat addTarget:self action:@selector(actionChat) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnChat = [[UIBarButtonItem alloc] initWithCustomView:btnChat];
    
    UIButton *btnAddJob = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btnAddJob setImage:[UIImage imageNamed:@"add_.png"] forState:UIControlStateNormal];
    [btnAddJob addTarget:self action:@selector(actionAddJob) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barAddJob = [[UIBarButtonItem alloc] initWithCustomView:btnAddJob];
    
    NSArray *rightBtnArray = [[NSArray alloc] initWithObjects:barAddJob, barBtnChat, nil];
    
    self.navigationItem.leftBarButtonItem = barBackButton;
//    self.navigationItem.rightBarButtonItem = rightBtnArray;
    self.navigationItem.rightBarButtonItems = rightBtnArray;
    self.navigationItem.hidesBackButton = YES;
}

- (void)actionChat
{
    [self gotoView:@"ChatVIew"];
}

- (void)actionAddJob
{
    [self gotoView:@"AddJobView"];
}

-(void) menuButtonPressed
{
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (void)actionSingleTap:(UITapGestureRecognizer *)ges
{
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.viewPlaceholder setAlpha:0];
        [self.viewCarousel setAlpha:1];
        [self.viewCarousel scrollToItemAtIndex:1 animated:YES];
        [self.csTop setConstant:-250];
        
        [self.view layoutIfNeeded];
    }];

}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [[[SessionInfo getSharedInstance] getJobOffers] count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    JobOffer *tJobOffer = (JobOffer *) [[[SessionInfo getSharedInstance] getJobOffers] objectAtIndex:index];
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 220)];
    [view addSubview:[self genCardView:tJobOffer]];
    
    return view;
}

- (UIView *)genCardView:(JobOffer *)jobOffer
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 320, 200)];
    [view setBackgroundColor:[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0]];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    
    UILabel *lblMinAgo = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 100, 30)];
    lblMinAgo.text = @"5 mins ago";
    
    UIImageView *imgViewMinAgo = [[UIImageView alloc] initWithFrame:CGRectMake(8, 5, 20, 20)];
    imgViewMinAgo.image = [UIImage imageNamed:@"Time.png"];
    
    UILabel *lblLocation = [[UILabel alloc] init];
    lblLocation.text = jobOffer.address;
    [lblLocation sizeToFit];
    CGRect lblLocationFrame = lblLocation.frame;
    lblLocationFrame.origin.x = 320 - lblLocation.frame.size.width - 8;
    lblLocationFrame.size.height = 30;
    lblLocation.frame = lblLocationFrame;
    
    UIImageView *imgViewLocation = [[UIImageView alloc] initWithFrame:CGRectMake(320 - lblLocation.frame.size.width - 25 - 8 - 2, 5, 20, 20)];
    imgViewLocation.image = [UIImage imageNamed:@"location.png"];
    
    [headerView addSubview:lblMinAgo];
    [headerView addSubview:lblLocation];
    [headerView addSubview:imgViewMinAgo];
    [headerView addSubview:imgViewLocation];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, 320, 200 - 30)];
    imageView.image = [UIImage imageWithData:jobOffer.jobImg];//[UIImage imageNamed:@"1230egx.jpg"];
    UIView *viewOverlay = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 320, 200-30)];
    [viewOverlay setBackgroundColor:[UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.5]];
    
    UIView *viewContent = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 300, 200-30)];
    UILabel *lblJobTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 280, 30)];
    lblJobTitle.text = jobOffer.title;
    lblJobTitle.font = [UIFont fontWithName:@"Roboto-Regular" size:21];
    lblJobTitle.textColor = [UIColor whiteColor];
    lblJobTitle.textAlignment = NSTextAlignmentCenter;
    
    UIView *viewSeparator1 = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 300, 1)];
    [viewSeparator1 setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imgJobDate = [[UIImageView alloc] initWithFrame:CGRectMake(11, 79, 20, 20)];
    [imgJobDate setImage:[UIImage imageNamed:@"date.png"]];
    
    UILabel *lblJobDate = [[UILabel alloc] initWithFrame:CGRectMake(40, 78, 120, 21)];
    lblJobDate.text = @"6 Dec - 12 Dec";
    lblJobDate.textColor = [UIColor whiteColor];
    
    UILabel *lblJobPay = [[UILabel alloc] initWithFrame:CGRectMake(200, 78, 120, 21)];
    lblJobPay.text = [NSString stringWithFormat:@"SGD %.0f p/day", jobOffer.salary];
    lblJobPay.textColor = [UIColor whiteColor];
    
    UIView *viewSeparator2 = [[UIView alloc] initWithFrame:CGRectMake(10, 109, 300, 1)];
    [viewSeparator2 setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *lblDesc = [[UILabel alloc] initWithFrame:CGRectMake(10, 115, 300, 30)];
    [lblDesc setText:jobOffer.desc];
    [lblDesc setTextColor:[UIColor whiteColor]];
    
    [viewContent addSubview:lblJobTitle];
    [viewContent addSubview:viewSeparator1];
    [viewContent addSubview:imgJobDate];
    [viewContent addSubview:lblJobDate];
    [viewContent addSubview:lblJobPay];
    [viewContent addSubview:viewSeparator2];
    [viewContent addSubview:lblDesc];
    
    [view addSubview:headerView];
    [view addSubview:imageView];
    [view addSubview:viewOverlay];
    [view addSubview:viewContent];
    
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    
    
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        default:
        {
            return value;
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
