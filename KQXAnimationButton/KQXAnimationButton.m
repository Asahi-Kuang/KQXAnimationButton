//
//  KQXAnimationButton.m
//  KQXAnimationButton
//
//  Created by Kxx.xxQ 一生相伴 on 15/9/3.
//  Copyright (c) 2015年 asahi_kuang. All rights reserved.
//

#import "KQXAnimationButton.h"

#define DISTANCE_X (CGRectGetWidth(button.frame)+10)
#define DISTANCE_Y (CGRectGetHeight(button.frame)+10)
#define ZERO 0.0f
@implementation KQXAnimationButton
{
    CGFloat _time;  // 动画时间
    KQXAnimationButton *_buttons;
    NSMutableArray *_buttonArray;
    BOOL _isOpen;
    KQXButtonScrollDirection _dirction;
}

#pragma mark --- 弹出按钮动画 ---
- (void) makeButtons:(NSMutableArray *)buttonArray ScrollAroundWithTime:(CGFloat)time {
    if ([buttonArray count] <= 5) {
        _time = time;
        _isOpen = NO;
        _buttonArray = buttonArray;
        [[_buttonArray lastObject] addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    }else {
        @throw [NSException exceptionWithName:@"错误" reason:@"数组元素过多" userInfo:nil];
    }
}

//======私有方法======//
- (void) startAnimation:(KQXAnimationButton *)button {
    if (button == [_buttonArray lastObject]) {
        if (!_isOpen) {
            [UIView animateWithDuration:_time animations:^{
                [button MAKEROTATION(M_PI_4)];
            }];
            for (int i = 0; i < [_buttonArray count] - 1; i ++) {
                KQXAnimationButton *btn = _buttonArray[i];
                
                // 两个变量，控制按钮弹出距离
                double tx = CGRectGetWidth(btn.frame) * 2;
                double ty = CGRectGetHeight(btn.frame) * 2;
                
                if (i == 0) {
                    tx = - tx;
                    ty = - ty/2;
                }else if (i == 1) {
                    tx = - tx / 2.5;
                    ty = - ty;
                }else if (i == 2) {
                    tx =  tx / 2.5;
                    ty = - ty;
                }else if (i == 3) {
                    tx = tx;
                    ty = - ty/2;
                }
                
                [UIView animateWithDuration:_time animations:^{
                    [btn setTransform:CGAffineTransformMakeTranslation(tx, ty)];
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.2 animations:^{
                        [btn setTransform:CGAffineTransformMakeTranslation(tx / 1.5, ty / 1.5)];
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.2 animations:^{
                            [btn setTransform:CGAffineTransformMakeTranslation(tx / 1.2, ty / 1.2)];
                        }];
                    }];
                }];
                _isOpen = YES;
            }
        }else {
            [UIView animateWithDuration:_time animations:^{
                [button MAKEROTATION(0)];
            }];
            for (int i = 0; i < [_buttonArray count] - 1; i ++) {
                KQXAnimationButton *btn = _buttonArray[i];
                [UIView animateWithDuration:0.25 animations:^{
                    [btn MAKETRANS(0, 0)];
                }];
            }
            _isOpen = NO;
        }
        
    }
}

#pragma mark --- 甩出多个按钮动画 ---
- (void) makeButtons:(NSMutableArray *)buttonArray ScrollWithTime:(CGFloat)time withScrollDirection:(KQXButtonScrollDirection) direction {
    _buttonArray = [NSMutableArray array];
    _buttonArray = buttonArray;
    _isOpen = NO;
    _dirction = direction;
    
    [[_buttonArray lastObject] addTarget:self action:@selector(makeScroll:) forControlEvents:UIControlEventTouchUpInside];
}


//========弹出动画私有方法,无法调用========//
- (void) makeScroll:(KQXAnimationButton *)button {
    if (button == [_buttonArray lastObject]) {
        [UIView animateWithDuration:0.3 animations:^{
            [button MAKESCALE(2, 2)];
            [button MAKESCALE(1, 1)];
        }];
        for (int i = 0; i < [_buttonArray count] - 1; i ++) {
            [self startScroll:_buttonArray[i] byIndex: i + 1];
        }
    }
}

- (void) startScroll:(KQXAnimationButton *)button byIndex:(NSInteger) index{
    if (_dirction == KQXButtonScrollFromLeft) {                 //从左到右
        
        [self scrollFromLeft:button byIndex:index];
        
    }else if (_dirction == KQXButtonScrollFromRight) {
        
        [self scrollFromRight:button byIndex:index];
        
    }else if (_dirction == KQXButtonScrollFromTop) {
        
        [self scrollFromTop:button byIndex:index];
        
    }else {
        
        [self scrollFromBottom:button byIndex:index];
        
    }
}

// 弹出,收回动画
- (void) scrollOutScrollInWithX:(NSInteger)x  withY:(NSInteger)y withButton:(KQXAnimationButton *)button byIndex:(NSInteger)index {
    if (!_isOpen) {
        [UIView animateWithDuration:0.3 animations:^{
            [button MAKEROTATION(M_PI)];
            [button MAKETRANS(x, y)];
        }];
        if (index == [_buttonArray count] - 1) {
            _isOpen = YES;
        }
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            [button MAKEROTATION(M_PI)];
            [button MAKETRANS(ZERO, ZERO)];
        }];
        if (index == [_buttonArray count] - 1) {
            _isOpen = NO;
        }
    }
}

// 方向 左边 -> 右边
- (void) scrollFromLeft:(KQXAnimationButton *)button byIndex:(NSInteger) index{
    
    [self scrollOutScrollInWithX:DISTANCE_X * index withY:ZERO withButton:button byIndex:index];
    
}

// 方向 右边 -> 左边
- (void) scrollFromRight:(KQXAnimationButton *)button byIndex:(NSInteger) index{
    
    [self scrollOutScrollInWithX: - DISTANCE_X * index withY:ZERO withButton:button byIndex:index];
    
}

// 方向 上边 -> 下边
- (void) scrollFromTop:(KQXAnimationButton *)button byIndex:(NSInteger) index{
    
    [self scrollOutScrollInWithX:ZERO withY:DISTANCE_Y * index withButton:button byIndex:index];
    
}

// 方向 下边 -> 上边
- (void) scrollFromBottom:(KQXAnimationButton *)button byIndex:(NSInteger) index{
    
    [self scrollOutScrollInWithX:ZERO withY: - DISTANCE_Y * index withButton:button byIndex:index];
    
}

#pragma mark --- 按钮伸展动画 ---
- (void) setExpandAnimationWithAnimationTime:(CGFloat)time {
    _time = time;
    if (_time != 0) {
        if (_time > 0 && _time <= 1) {
            if (_time > 0 && _time <= 0.5) {
                //
            }else {
                _time -= 0.2;
            }
        }else {
            // 如果超出范围,抛异常。
            @throw [NSException exceptionWithName:@"错误" reason:@"time 范围0~1" userInfo:nil];
        }
        [UIView animateWithDuration:_time animations:^{
            //
            [self MAKESCALE(0.9, 1)];
            [self MAKESCALE(1.1, 1)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:_time animations:^{
                [self MAKESCALE(0.9, 1)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 animations:^{
                    [self MAKESCALE(1, 1)];
                }];
            }];
        }];
    }else {
        @throw [NSException exceptionWithName:@"错误" reason:@"time不能为0" userInfo:nil ];
    }
}

#pragma mark --- 按钮按下弹起动画 ---
/*
 动画时间范围 0 < time <= 1。 超出范围会抛出异常，程序会崩溃。time值越大，动画的效果越慢。
 */
- (void) setWaveAnimationWithAnimationTime:(CGFloat)time {
    _time = time;
    // 动画持续时间控制
    if (_time != 0) {
        if (_time > 0 && _time <= 1) {
            if (_time > 0 && _time <= 0.5) {
                
            }else {
                _time -= 0.2;
            }
        }else {
            // 如果超出范围,抛异常。
            @throw [NSException exceptionWithName:@"错误" reason:@"time 范围0~1" userInfo:nil];
        }
        
        [UIView animateWithDuration:_time animations:^{
            [self MAKESCALE(2, 2)];
            [self MAKESCALE(0.8, 0.8)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                [self MAKESCALE(1.4, 1.4)];
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.15 animations:^{
                    [self MAKESCALE(1, 1)];
                }];
            }];
        }];
    }else {
        @throw [NSException exceptionWithName:@"错误" reason:@"time不能设为0" userInfo:nil];
    }
}

#pragma mark --- 创建按钮 ---
+ (KQXAnimationButton *) createButtonWithFrame:(CGRect)frame
                                withButtonType:(UIButtonType)type
                                     withTitle:(NSString *)title
                                      forState:(UIControlState)state
                                withTitleColor:(UIColor *)titleColor
                           withBackgroundColor:(UIColor *)bgColor
                                 withTitleFont:(UIFont *)font
                                    withTarget:(id)target
                                  withSelector:(SEL)selector
                                     withEvent:(UIControlEvents)events {
    
    KQXAnimationButton *button = [KQXAnimationButton buttonWithType:type];
    [button setFrame:frame];
    [button setTitle:title forState:state];
    [button setTitleColor:titleColor forState:state];
    [button setBackgroundColor:bgColor];
    [button.titleLabel setFont:font];
    [button addTarget:target action:selector forControlEvents:events];
    
    return button;
}

#pragma mark --- 设置按钮圆角 ---
- (void) setButtonCornerRadius:(CGFloat) radius {
    [self.layer setCornerRadius:radius];
}

#pragma mark --- 设置任意圆角度数让按钮成圆 ---
- (void)makeButtonBeRoundedByCornerRadius:(CGFloat)radius {
    [self setButtonCornerRadius:radius];
    // 让按钮根据度数来改变大小。
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), radius * 2, radius * 2)];
}

#pragma mark --- 设置按钮背景图片 ---
- (void) setKQXButtonBackgroundImage:(UIImage *)bgImage forState:(UIControlState)state {
    
    [self setBackgroundImage:[bgImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:state];
}

#pragma mark --- 设置按钮图片(非背景图片) ---
- (void) setKQXButtonImage:(UIImage *)btnImage forState:(UIControlState)state {
    
    [self setImage:[btnImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:state];
    
}






















@end
