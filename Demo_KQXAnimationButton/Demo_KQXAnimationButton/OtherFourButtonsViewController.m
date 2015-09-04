//
//  OtherFourButtonsViewController.m
//  Demo_KQXAnimationButton
//
//  Created by Kxx.xxQ 一生相伴 on 15/9/4.
//  Copyright (c) 2015年 asahi_kuang. All rights reserved.
//

#import "OtherFourButtonsViewController.h"

@interface OtherFourButtonsViewController ()
{
    NSMutableArray *_btnArr;
}
@end

@implementation OtherFourButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void) createUI {
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:30/255.0 green:136/255.0 blue:168/255.0 alpha:1]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _btnArr = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        KQXAnimationButton *btns = [KQXAnimationButton createButtonWithFrame:CGRectMake(150, 200, 50, 50) withButtonType:UIButtonTypeCustom withTitle:nil forState:UIControlStateNormal withTitleColor:[UIColor darkGrayColor] withBackgroundColor:[UIColor whiteColor] withTitleFont:[UIFont boldSystemFontOfSize:15] withTarget:self withSelector:@selector(go:) withEvent:UIControlEventTouchUpInside];

        [_btnArr addObject:btns];
 
        if (i == 4) {
            [[_btnArr lastObject] setKQXButtonBackgroundImage:[UIImage imageNamed:@"flight_ico_flight_addpassenger_plus@2x.png"] forState:UIControlStateNormal];

        }else {
        [[_btnArr lastObject] setKQXButtonBackgroundImage:[UIImage imageNamed:@"flight_list_icon_red@2x.png"] forState:UIControlStateNormal];
        }
        [btns makeButtonBeRoundedByCornerRadius:15];
        [self.view addSubview:btns];
        [btns makeButtons:_btnArr ScrollAroundWithTime:0.3];
        
    }
}
- (void) go:(KQXAnimationButton *)button {
    
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
