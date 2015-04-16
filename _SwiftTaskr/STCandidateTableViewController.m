//
//  STCandidateTableViewController.m
//  _SwiftTaskr
//
//  Created by ChunQhai on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "STCandidateTableViewController.h"
#import "STAddJobViewController.h"

@interface STCandidateTableViewController ()
{
    NSArray *candidateList;
    long prev;
}

@end

@implementation STCandidateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    candidateList = [[NSArray alloc] initWithObjects:@"3 Candidates - SGD 5",
                     @"5 Candidates - SGD 8",
                     @"10 Candidates - SGD 12",
                     @"15 Candidates - SGD 16",@"20 Candidates - SGD 20",@"30 Candidates - SGD 25", nil];
    [self setUpBackButton];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (![[self.navigationController viewControllers] containsObject:self]) {
        STAddJobViewController *controller =
        [[STAddJobViewController alloc] init];
        
        controller.selectedCandidate = self.result;

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CandidateCell" forIndexPath:indexPath];
    
     //Configure the cell...
   
    
    cell.textLabel.text = [candidateList objectAtIndex:indexPath.row];
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType==UITableViewCellAccessoryNone)
    {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        self.result = cell.textLabel.text;

        if (prev!=indexPath.row) {
            cell=[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:prev inSection:0]];
            cell.accessoryType=UITableViewCellAccessoryNone;
            self.result = [candidateList objectAtIndex:indexPath.row];
            prev=indexPath.row;
        }
        
    }
    else{
        cell.accessoryType=UITableViewCellAccessoryNone;
        self.result = @"";
    }
}

-(void) setUpBackButton
{
    self.title = @"Tele-marketing";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [self colorWithHexString:@"37AD96"]}];
    self.navigationController.navigationBar.translucent = NO;
    
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
    if( self.delegate != nil && [self.delegate respondsToSelector:@selector(onDismiss:)] ) {
        [self.delegate onDismiss:self.result];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

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
}/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
