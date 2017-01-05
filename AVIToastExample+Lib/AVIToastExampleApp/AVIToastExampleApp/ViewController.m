//
//  ViewController.m
//  AVIToastExampleApp
//
//  Created by Avinash Kumar Gautam on 02/01/17.
//  Copyright © 2017 Avinash Kumar Gautam. All rights reserved.
//

#import "ViewController.h"
#import "ShowAVIToastViewController.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (strong, nonatomic) IBOutlet UITableView *AVToastTypesTableView;
@property (strong, nonatomic) NSArray *tableData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AVIToast Example";
    _tableData = @[@"AVToast-Simple Default Values",@"AVToast-Full Customization"];
    _AVToastTypesTableView.delegate = self;
    _AVToastTypesTableView.dataSource = self;
}

#pragma mark - _AVToastTypesTableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableData.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showToastForRow:indexPath.row];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    return cell;
}

-(void)showToastForRow:(NSInteger)row {
    ShowAVIToastViewController *showVC = [[ShowAVIToastViewController alloc]init];
    if (row == 0) {
        showVC.rowNumber = row;
    } else if (row == 1) {
        showVC.rowNumber = row;
    }
    [self.navigationController pushViewController:showVC animated:YES];
}
@end
