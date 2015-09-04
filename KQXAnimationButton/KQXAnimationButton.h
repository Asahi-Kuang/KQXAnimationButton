//
//  KQXAnimationButton.h
//  KQXAnimationButton
//
//  Created by Kxx.xxQ 一生相伴 on 15/9/3.
//  Copyright (c) 2015年 asahi_kuang. All rights reserved.
//


/*
    PS.最好不要多个动画合在一起使用。
    Email:kqx18681632146@live.com
 */

#import <UIKit/UIKit.h>

typedef enum KQXButtonScroll{
    KQXButtonScrollFromLeft   = 0,
    KQXButtonScrollFromRight  = 1 << 0,
    KQXButtonScrollFromTop    = 1 << 1,
    KQXButtonScrollFromBottom = 1 << 2
}KQXButtonScrollDirection;

#define MAKETRANS(tx, ty)   setTransform:CGAffineTransformMakeTranslation(tx, ty)   // 位移
#define MAKEROTATION(angle) setTransform:CGAffineTransformMakeRotation(angle)       // 旋转
#define MAKESCALE(x, y)     setTransform:CGAffineTransformMakeScale(x, y)           // 缩放

@interface KQXAnimationButton : UIButton

/**
 *  创建按钮
 */
+ (KQXAnimationButton *) createButtonWithFrame:(CGRect)frame
                       withButtonType:(UIButtonType)type
                            withTitle:(NSString *)title
                             forState:(UIControlState)state
                       withTitleColor:(UIColor *)titleColor
                  withBackgroundColor:(UIColor *)bgColor
                        withTitleFont:(UIFont *)font
                           withTarget:(id)target
                         withSelector:(SEL)selector
                            withEvent:(UIControlEvents)events;

/**
 *  添加按钮背景图片
 */
- (void) setKQXButtonBackgroundImage:(UIImage *)bgImage forState:(UIControlState)state;

/**
 *  添加按钮图片(非背景图片),无按钮文字版
 */
- (void) setKQXButtonImage:(UIImage *)btnImage forState:(UIControlState)state;

/**
 *  更改按钮圆角度数
 */
- (void) setButtonCornerRadius:(CGFloat) radius;


/**
 *  任意圆角度数成圆
 */
- (void) makeButtonBeRoundedByCornerRadius:(CGFloat) radius;


//====================//
//     点击动画        //
//====================//

/**
 *  按钮点下，反弹效果, time的范围(0 ~ 1), 时间越大 动画越慢。
 *
 *  @param time      动画持续时间
 */
- (void) setWaveAnimationWithAnimationTime:(CGFloat)time;

/**
 *  按钮点击，按钮向左右伸张动画, time范围(0 ~ 1)
 */
- (void) setExpandAnimationWithAnimationTime:(CGFloat)time;


/**
 *  点击最外层按钮，甩出其它按钮
 *
 *  @param buttonArray 按钮数组
 *  @param time        动画时间
 *  @param direction   动画弹出方向
 */
- (void) makeButtons:(NSMutableArray *)buttonArray ScrollWithTime:(CGFloat)time withScrollDirection:(KQXButtonScrollDirection) direction;

/**
 *  点击最外层按钮，弹出四个小按钮
 *
 *  @param buttonArray 按钮数组
 *  @param time        动画时间
 */
- (void) makeButtons:(NSMutableArray *)buttonArray ScrollAroundWithTime:(CGFloat)time;

@end
