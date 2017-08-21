//
//  WWNavigationBar.m
//  WWDemo
//
//  Created by Live on 2017/8/17.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

//参考网址：https://stackoverflow.com/questions/18897485/achieving-bright-vivid-colors-for-an-ios-7-translucent-uinavigationbar

#import "WWNavigationBar.h"

///修改透明图
static CGFloat const kDefaultColorLayerOpacity = 0.5f;
//状态栏高度
static CGFloat const kSpaceToCoverStatusBars = 20.0f;
//重置y
static const CGFloat kOriginY = 10.0f;

@implementation WWNavigationBar


- (void)setBarTintColor:(UIColor *)barTintColor {
    [super setBarTintColor:barTintColor];
    if (self.colorLayer == nil) {
        self.colorLayer = [CALayer layer];
        self.colorLayer.opacity = kDefaultColorLayerOpacity;
        [self.layer addSublayer:self.colorLayer];
    }
    self.colorLayer.backgroundColor = barTintColor.CGColor;
    
}

- (CGSize)sizeThatFits:(CGSize)size{
//    self.barTintColor = [UIColor redColor];
    CGSize newSize = [super sizeThatFits:size];
    //下边的写法可能被调用多次
//    newSize.height += 5;
    newSize.height = 100;
//    CGSize newSize = CGSizeMake(self.frame.size.width, 200);
    return newSize;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UINavigationItem *navigationItem = [self topItem];
    WWLog(@"%@",self.items)
    for (UIView *subview in [self subviews]) {

        if (subview == [[navigationItem rightBarButtonItem] customView]) {

            CGRect rect = subview.frame;
            rect.origin.y = kOriginY;
//            rect.origin.y -= subview.frame.size.height * 0.5;
            subview.frame = rect;
        }
        else if (subview == [[navigationItem backBarButtonItem] customView]) {

            CGRect rect = subview.frame;
            rect.origin.y = kOriginY;
            subview.frame = rect;

        }else if(subview == [navigationItem titleView]){
            
            //TODO: - TODO：这个地方以后加上对于title的改变的位置
            //FIXME: - FIXME: 其实不用在这里写了，在上边的别的地方就有操作了，如果是自己定义的titleView

            subview.backgroundColor = [UIColor redColor];
            CGRect rect = subview.frame;
            rect.origin.y = kOriginY;
            subview.frame = rect;
//            可疑的
//            UINavigationItemView *v;
        }
        
    }
    
    
    if (self.colorLayer != nil) {
        self.colorLayer.frame = CGRectMake(0, 0 - kSpaceToCoverStatusBars, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + kSpaceToCoverStatusBars);
        
        [self.layer insertSublayer:self.colorLayer atIndex:1];
    }
    
}


/// 统一设置导航栏外观
#pragma mark - 改变导航栏的样式
- (void)setNavigationBarStyle
{
    return;
    //当要使用这个方法的时候记得把上边的那些透明的处理去掉 否则的话效果不佳
    //设置渐变颜色
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = @[ (__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor brownColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    UIGraphicsBeginImageContext(gradientLayer.bounds.size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBackgroundImage:gradientImage forBarMetrics:UIBarMetricsDefault];
    
    return;
    //单单设置背景图片的话 可能背景图片撑不满导航栏 设置渐变的形式却是可以的
    //用的时候可能出现高度不够用 可能是因为图的原因
    /** 设置导航栏背景图片 */
    [self setBackgroundImage:[UIImage imageNamed:@"rectangle"] forBarMetrics:UIBarMetricsDefault];
    // 设置导航栏标题文字颜色
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor]
                           };
    [self setTitleTextAttributes:dict];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
