//
//  ExtendViewController.m
//  Demo_KQXAnimationButton
//
//  Created by Kxx.xxQ 一生相伴 on 15/9/4.
//  Copyright (c) 2015年 asahi_kuang. All rights reserved.
//

#import "ExtendViewController.h"

@interface ExtendViewController ()
{
    UISlider *_slider;
}
@end

@implementation ExtendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void) createUI {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    // 创建按钮
    KQXAnimationButton *btn = [KQXAnimationButton createButtonWithFrame:CGRectMake(135, 120, 80, 32) withButtonType:UIButtonTypeSystem withTitle:@"PressMe" forState:UIControlStateNormal withTitleColor:[UIColor whiteColor] withBackgroundColor:[UIColor orangeColor] withTitleFont:[UIFont boldSystemFontOfSize:15] withTarget:self withSelector:@selector(buttonClicked:) withEvent:UIControlEventTouchUpInside];
    [btn.layer setCornerRadius:16];
    [self.view addSubview:btn];
    
    // 改变动画时间
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 220, 280, 20)];
    [_slider setValue:0];
    [_slider setMinimumValue:0.1f];
    [_slider setMaximumValue:1.0f];
    [self.view addSubview:_slider];
}
- (void) buttonClicked:(KQXAnimationButton *)button {
    // 动画
    [button setExpandAnimationWithAnimationTime:_slider.value];
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
