//
//  MakeButtonScollOutViewController.m
//  Demo_KQXAnimationButton
//
//  Created by Kxx.xxQ 一生相伴 on 15/9/4.
//  Copyright (c) 2015年 asahi_kuang. All rights reserved.
//

#import "MakeButtonScollOutViewController.h"

@interface MakeButtonScollOutViewController () {
    NSMutableArray *_buttonArr;
    KQXAnimationButton *_btns;
}

@end

@implementation MakeButtonScollOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void) createUI {
    [self.navigationController.navigationBar setBarTintColor:[UIColor cyanColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _buttonArr = [NSMutableArray array];
    for (int i = 0; i < 4; i ++) {
        _btns = [KQXAnimationButton createButtonWithFrame:CGRectMake(135, 250, 36, 36) withButtonType:UIButtonTypeSystem withTitle:nil forState:UIControlStateNormal withTitleColor:[UIColor whiteColor] withBackgroundColor:[UIColor clearColor] withTitleFont:[UIFont boldSystemFontOfSize:15] withTarget:self withSelector:@selector(buttonClicked:) withEvent:UIControlEventTouchUpInside];
        
        [_btns setKQXButtonImage:[UIImage imageNamed:@"flight_list_icon_red@2x.png"] forState:UIControlStateNormal];
        
        [_buttonArr addObject:_btns];
        [self.view addSubview:_btns];
        [_btns makeButtons:_buttonArr ScrollWithTime:0.3 withScrollDirection:KQXButtonScrollFromTop];
    }
    
    NSArray *direction = @[@"L->R", @"R->L", @"T->B", @"B->T"];
    for (int i = 0; i < 4; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setFrame:CGRectMake(70 * i + 20, 400, 70, 30)];
        [btn setTitle:direction[i] forState:UIControlStateNormal];
        [btn setTag:1000 + i];
        [btn addTarget:self action:@selector(changeDirction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}
// 改变甩出的方向
- (void) changeDirction:(UIButton *)button {
    for (int i = 0; i < 4; i ++) {
        [_btns makeButtons:_buttonArr ScrollWithTime:0.3 withScrollDirection:(KQXButtonScrollDirection)(button.tag-1000)];
    }
}
- (void) buttonClicked:(KQXAnimationButton *)button {
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
