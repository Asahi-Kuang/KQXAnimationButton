//
//  RoundedViewController.m
//  Demo_KQXAnimationButton
//
//  Created by Kxx.xxQ 一生相伴 on 15/9/4.
//  Copyright (c) 2015年 asahi_kuang. All rights reserved.
//

#import "RoundedViewController.h"

@interface RoundedViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) KQXAnimationButton *changeBtn;
@end

@implementation RoundedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void) createUI {
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _changeBtn = [KQXAnimationButton createButtonWithFrame:CGRectMake(135, 250, 70, 40) withButtonType:UIButtonTypeSystem withTitle:@"change" forState:UIControlStateNormal withTitleColor:[UIColor whiteColor] withBackgroundColor:[UIColor purpleColor] withTitleFont:[UIFont boldSystemFontOfSize:15] withTarget:self withSelector:@selector(changeTheRadius:) withEvent:UIControlEventTouchUpInside];
    [self.view addSubview:_changeBtn];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(35, 200, 250, 40)];
    [_textField setPlaceholder:@"输入度数"];
    [_textField setBackgroundColor:[UIColor orangeColor]];
    [_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self.view addSubview:_textField];
}
- (void) changeTheRadius:(KQXAnimationButton *) button {
    if ([_textField.text floatValue] > 0.0f) {
        [_changeBtn makeButtonBeRoundedByCornerRadius:[_textField.text floatValue]];
    }else {
        NSLog(@"值大于等于0");
    }
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_textField resignFirstResponder];
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
