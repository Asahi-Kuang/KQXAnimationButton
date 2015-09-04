//
//  ViewController.m
//  Demo_KQXAnimationButton
//
//  Created by Kxx.xxQ 一生相伴 on 15/9/4.
//  Copyright (c) 2015年 asahi_kuang. All rights reserved.
//

#import "ViewController.h"
#import "RoundedViewController.h"
#import "WaveViewController.h"
#import "ExtendViewController.h"
#import "MakeButtonScollOutViewController.h"
#import "OtherFourButtonsViewController.h"



@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    [self.navigationItem setTitle:@"选择动画效果"];
    [self createTableView];
}
- (void) createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView setTableFooterView:[UIView new]];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];
}
#pragma mark --- tableView delegate && datasource ---
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (! cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }else {
        while ([cell.contentView.subviews lastObject]) {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    NSArray *cellName = @[@"任意度数成正圆",@"波浪动画",@"伸展动画",@"按钮甩出",@"弹出四个按钮"];
    [cell.textLabel setText:cellName[indexPath.row]];
    
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    RoundedViewController *rVc = [[RoundedViewController alloc] init];
    WaveViewController *wVc = [[WaveViewController alloc] init];
    ExtendViewController *eVc = [[ExtendViewController alloc] init];
    MakeButtonScollOutViewController *mbsVc = [[MakeButtonScollOutViewController alloc] init];
    OtherFourButtonsViewController *ofbVc = [[OtherFourButtonsViewController alloc] init];
    NSArray *controllers = @[rVc, wVc, eVc, mbsVc, ofbVc];
    [self.navigationController pushViewController:controllers[indexPath.row] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
