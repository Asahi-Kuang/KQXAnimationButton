
#ReadMe

**Version: 1.1v**
**Author: Asahi Kuang**
**Email: asahikuang@yahoo.com**
**QQ: 375961900**

##KQXAnimationButton

#####包含的功能概述:
1. 封装了创建UIButton的方法，不用一个属性一个属性的写。不需要的属性直接nil就ok了。
2. 封装了设置按钮图片和背景图片的方法。
3. 封装了设置按钮圆角的方法。  
4. 封装了几个小型的按钮点击的动画效果。
5. 测试环境: Xcode6.4 + iOS8.4

####PS:最好不要多个动画合在一起用。弹出按钮动画用于5个按钮，一个点击，四个弹出。 OTZ

#####接口一览:

#######创建按钮:
```
// 创建按钮
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
```

#######添加按钮背景图片
```
- (void) setKQXButtonBackgroundImage:(UIImage *)bgImage forState:(UIControlState)state;
```
#######添加按钮图片(非背景图)
```
- (void) setKQXButtonImage:(UIImage *)btnImage forState:(UIControlState)state;
```
#######更改圆角度数
```
- (void) setButtonCornerRadius:(CGFloat) radius;
```
#######任意圆角度数让按钮成正圆
```
- (void) makeButtonBeRoundedByCornerRadius:(CGFloat) radius;
```
#######按钮按下弹起动画
```
- (void) setWaveAnimationWithAnimationTime:(CGFloat)time;
```
#######按钮左右伸展收回动画
```
- (void) setExpandAnimationWithAnimationTime:(CGFloat)time;
```
#######点击最外层按钮,甩出其它按钮动画
```
- (void) makeButtons:(NSMutableArray *)buttonArray ScrollWithTime:(CGFloat)time withScrollDirection:(KQXButtonScrollDirection) direction;
```
#######点击最外层按钮，弹出其它按钮动画
```
- (void) makeButtons:(NSMutableArray *)buttonArray ScrollAroundWithTime:(CGFloat)time;
```
####动画展示:


![link pic](http://a3.qpic.cn/psb?/V106iJhq3r5pvo/k5qbQ3g4o.GelvvLrdRdRFskeSAc9huF*U5KflxHMyE!/b/dGQBAAAAAAAA&bo=4AENAuABDQICGDw!&rf=viewer_4)
	**压下弹起效果：**
    ++————————————————————————————————————————————————————————++
    

![link pic](http://a3.qpic.cn/psb?/V106iJhq3r5pvo/oDcqjuUyynMCkTOXP463*8DJXaMsPc2otkjvhAq8zKE!/b/dGQBAAAAAAAA&bo=4wFyAuMBcgICGDw!&rf=viewer_4)
	**任意圆角度数成正圆：**
    ++————————————————————————————————————————————————————————++
    
![link pic](http://a2.qpic.cn/psb?/V106iJhq3r5pvo/8.s74uUmZodiMSS3u44V0KxJ9kCJDloZKD0Hsj0MVto!/b/dGMBAAAAAAAA&bo=4wH6AeMB.gECGDw!&rf=viewer_4)
	**按钮伸展收回效果**
        ++————————————————————————————————————————————————————————++
        
        
![link pic](http://a2.qpic.cn/psb?/V106iJhq3r5pvo/m7jKzAZimYWqY0CrP4yiwK.6k1JVr4Mdi2YqG4T44Is!/b/dGMBAAAAAAAA&bo=4QGfAuEBnwICGDw!&rf=viewer_4)
	**甩出按钮效果**
        ++————————————————————————————————————————————————————————++
    
![link pic](http://a2.qpic.cn/psb?/V106iJhq3r5pvo/Lpig03jtXGssYXUrHTUEDIndEklMomo21x6MscctrQA!/b/dGMBAAAAAAAA&bo=3gHWAd4B1gECGDw!&rf=viewer_4)
	**弹出四个按钮效果**
        ++————————————————————————————————————————————————————————++
