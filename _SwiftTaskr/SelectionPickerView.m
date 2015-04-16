//
//  SelectionPickerView.m
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/6/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "SelectionPickerView.h"

@interface SelectionPickerView ()

@property(nonatomic, retain) NSMutableArray *myDataSource;
@property(nonatomic, retain) NSMutableArray *mySelectedIndex;
@property(nonatomic) BOOL allowMultipleSelection;

@end

@implementation SelectionPickerView

static NSString *simpleTableIdentifier = @"SelectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDataSource:(NSArray *)dataSource
{
    if( _myDataSource == nil ) {
        _myDataSource = [[NSMutableArray alloc] init];
    }
    
    [_myDataSource removeAllObjects];
    [_mySelectedIndex removeAllObjects];
    
    [_myDataSource addObjectsFromArray:dataSource];
    
    for(int i = 0; i < [dataSource count]; i++) {
        [_mySelectedIndex addObject:[NSNumber numberWithBool:NO]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_myDataSource count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if ( [_mySelectedIndex count] > 1) {
        for(int i = 0; i < [_mySelectedIndex count]; i++) {
            BOOL tFlag = NO;
            
            @try {
                tFlag = [[_mySelectedIndex objectAtIndex:i] boolValue];
                
                if( tFlag ) {
                    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                    
                } else {
                    [cell setAccessoryType:UITableViewCellAccessoryNone];
                    
                }
            }
            @catch (NSException *exception) {
                NSLog(@"%@: %@", [self class], exception);
                
            }
            
        }
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if( cell.accessoryType == UITableViewCellAccessoryNone ) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
}

- (void)setAllowMultipleSelection:(BOOL)flag
{
    _allowMultipleSelection = flag;
}

- (void)setSelectedIndex:(NSInteger)index
{
    [_mySelectedIndex replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:YES]];
}

- (void)setSelectedValue:(NSString *)value
{
    for(int i = 0; i < [_myDataSource count]; i++) {
        SelectionItem *tItem = [_myDataSource objectAtIndex:i];
        
        if( [tItem.value isEqualToString:value] ) {
            [self setSelectedIndex:i];
            return;
            
        }
    }
}

- (void)show
{
    if( self.delegate != nil ) {
        [((UIViewController *)[self delegate]).navigationController pushViewController:self animated:YES];
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
