//
//  STMessageBoxViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 11/18/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STMessageBoxViewController.h"

@interface STMessageBoxViewController () <AMBubbleTableDataSource, AMBubbleTableDelegate>

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation STMessageBoxViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpUI];
    
    //Bubble Table Setup
    [self setDataSource:self];
    [self setDelegate:self];
    
    [self setTitle:@"Chat"];
    
    //Set Dummy Data
    [self setUpDummyData];
    
    //Set a Style
    [self setTableStyle:AMBubbleTableStyleFlat];
    
    //Call super after setting up the options
    [super viewDidLoad];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(20, 5, 0, 0)];
//    [self fakeMessages];
}

-(void) setUpUI
{
    [self setUPMenuButton];
    [self setUpDetailButton];
    
    

}

#pragma mark - Methods
-(void) setUPMenuButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 15, 22)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:YES];
    
    
    UIBarButtonItem *barBackButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = barBackButton;
    self.navigationItem.hidesBackButton = YES;
}

-(void) setUpDetailButton
{
    UIButton *detailButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 15)];
    [detailButton setBackgroundImage:[UIImage imageNamed:@"More 4"] forState:UIControlStateNormal];
    
    UIBarButtonItem *barDetailButton = [[UIBarButtonItem alloc] initWithCustomView:detailButton];
    self.navigationItem.rightBarButtonItem = barDetailButton;
    self.navigationItem.hidesBackButton = YES;
}

-(void) backButtonPressed
{
    [self.navigationController popToRootViewControllerAnimated:YES];

}

-(void) setUpDummyData
{
    self.data = [[NSMutableArray alloc] initWithArray:@[
                                                        @{
                                                            @"text": @"Hello, I really like your profile picture, we would like to invite for an interview if interested?",
                                                            @"date": [NSDate date],
                                                            @"type": @(AMBubbleCellReceived),
                                                            @"username": self.receiverName,
                                                            @"color": [UIColor redColor]
                                                            },
                                                        ]
                 ];

}

- (void)fakeMessages
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self didSendText:@"Fake message here!"];
        [self fakeMessages];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AMBubbleTableDataSource
-(NSInteger)numberOfRows
{
    return self.data.count;
}

-(AMBubbleCellType)cellTypeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.data[indexPath.row][@"type"] intValue];
}

-(NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.data[indexPath.row][@"text"];
}

-(NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [NSDate date];
}

-(UIImage *)avatarForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        return [UIImage imageNamed:self.receiverPic];
    }
    return [UIImage imageNamed:@"Romy.jpg"];
}

#pragma mark - AMBubbleTableDelegate

-(void)didSendText:(NSString *)text
{
    [self.data addObject:@{ @"text": text,
                            @"date": [NSDate date],
                            @"type":@(AMBubbleCellSent)
                            }];
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:(self.data.count - 1) inSection:0];
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    [self.tableView endUpdates];
    
    //Either to this:
    [self scrollToBottomAnimated:YES];
}

-(UIColor *)usernameColorForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.data[indexPath.row][@"color"];
}

-(NSString *)usernameForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.data[indexPath.row][@"username"];
}



@end
