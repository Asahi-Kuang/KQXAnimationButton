//
//  WaveViewController.m
//  Demo_KQXAnimationButton
//
//  Created by Kxx.xxQ 一生相伴 on 15/9/4.
//  Copyright (c) 2015年 asahi_kuang. All rights reserved.
//

#import "WaveViewController.h"

@interface WaveViewController () {
    UISlider *_slider;
}

@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void) createUI {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    // 创建按钮
    KQXAnimationButton *btn = [KQXAnimationButton createButtonWithFrame:CGRectMake(135, 120, 70, 40) withButtonType:UIButtonTypeSystem withTitle:nil forState:UIControlStateNormal withTitleColor:[UIColor whiteColor] withBackgroundColor:[UIColor clearColor] withTitleFont:[UIFont boldSystemFontOfSize:15] withTarget:self withSelector:@selector(buttonClicked:) withEvent:UIControlEventTouchUpInside];
    
    // 给按钮添加图片
    [btn setKQXButtonImage:[UIImage imageNamed:@"flight_list_icon_red@2x.png"] forState:UIControlStateNormal];
    
    // 任意度数成正圆
    [btn makeButtonBeRoundedByCornerRadius:21];
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
    [button setWaveAnimationWithAnimationTime:_slider.value];
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
