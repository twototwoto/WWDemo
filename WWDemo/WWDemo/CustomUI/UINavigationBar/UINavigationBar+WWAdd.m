//
//  UINavigationBar+WWAdd.m
//  WWDemo
//
//  Created by Live on 2017/8/17.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//
//给分类添加属性的参考：http://www.jianshu.com/p/3cbab68fb856
//导航栏渐变参考：https://stackoverflow.com/questions/31889600/how-can-i-create-a-horizontal-gradient-background-for-my-ios-nav-bar/31901915#31901915
#import "UINavigationBar+WWAdd.h"

//
//#import <objc/runtime.h>
//
////重置y
//static const CGFloat kOriginY = 40.0f;
//
//static NSString *previousCGSizeKey = @"previousCGSize";
//static NSString *flagStrKey = @"flagStrKey";
//
@implementation UINavigationBar (WWAdd)
//
//-(void)setBarTintColor:(UIColor *)barTintColor{
////    self.barTintColor = [UIColor redColor];
//}
//
//- (void)setFlagStr:(NSString *)flagStr{
//    objc_setAssociatedObject(self, &flagStrKey, flagStr, OBJC_ASSOCIATION_COPY);
//}
//- (NSString *)flagStr{
//    return objc_getAssociatedObject(self, &flagStrKey);
//}
//
//- (void)setPreviousSize:(CGSize)previousSize{
//    
////    objc_setAssociatedObject(self, &previousCGSizeKey, previousSize, OBJC_ASSOCIATION_COPY);
//}
//
//- (CGSize)previousSize{
//    return CGSizeZero;
//}
//
//- (CGSize)sizeThatFits:(CGSize)size{
////    self.barTintColor = [UIColor redColor];
//    CGSize newSize = [super sizeThatFits:size];
//    
////    newSize.height += 5;
//    //这个方法会调用多次 所以用的定值写死了
//    newSize.height = 100;
////    CGSize newSize = CGSizeMake(self.frame.size.width, 200);
//    return newSize;
//}
//
//- (void)layoutSubviews {
//    //FIXME: - FIXME: 如果是想要用分类来改变item的高度的话 如果是重写了layoutSubViews NavigationBar的背景色(在自己给navigationBar添加背景图片的时候背景图片也会没了)就没了 所以有需要的话暂时还是先用新建子类 继承的方式来做
//    // 这个方法会调用多次 那么说可以给分类添加个属性 来控制这个方法里边的内容 加载次数
//
//
//    [super layoutSubviews];
//    if(!self.flagStr){
//        self.flagStr = @"flagStr";
//        UINavigationItem *navigationItem = [self topItem];
//        
//        for (UIView *subview in [self subviews]) {
//            
//            if (subview == [[navigationItem rightBarButtonItem] customView]) {
//                
//                CGRect rect = subview.frame;
//                rect.origin.y = kOriginY;
//                //            rect.origin.y -= subview.frame.size.height * 0.5;
//                subview.frame = rect;
//            }
//            else if (subview == [[navigationItem backBarButtonItem] customView]) {
//                
//                CGRect rect = subview.frame;
//                //            rect.origin.y -= subview.frame.size.height * 0.5;
//                rect.origin.y = kOriginY;
//                subview.frame = rect;
//                
//            }
//        }
//        WWLog(@"%@",self.barTintColor);
//        [self.layer removeAllAnimations];
//        [self.layer.sublayers makeObjectsPerformSelector:@selector(removeAllAnimations)];
//        WWLog(@"%@",self.flagStr);
//    }
//    
//    //这么写应该是为了避免多次调用方法
////    if (!CGSizeEqualToSize(self.bounds.size, self.previousSize)) {
////        self.previousSize = self.bounds.size;
////        [self.layer removeAllAnimations];
////        [self.layer.sublayers makeObjectsPerformSelector:@selector(removeAllAnimations)];
////        
////    }
//
//    return;
//}
//
//
///// 统一设置导航栏外观
//#pragma mark - 改变导航栏的样式
//- (void)setNavigationBarStyle
//{
//    //设置渐变颜色
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = self.bounds;
//    gradientLayer.colors = @[ (__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor brownColor].CGColor];
//    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
//    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
//    
//    UIGraphicsBeginImageContext(gradientLayer.bounds.size);
//    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self setBackgroundImage:gradientImage forBarMetrics:UIBarMetricsDefault];
//    
//    return;
//    //单单设置背景图片的话 可能背景图片撑不满导航栏 设置渐变的形式却是可以的
//    //用的时候可能出现高度不够用 可能是因为图的原因
//    /** 设置导航栏背景图片 */
//    [self setBackgroundImage:[UIImage imageNamed:@"rectangle"] forBarMetrics:UIBarMetricsDefault];
//    // 设置导航栏标题文字颜色
//    NSDictionary *dict = @{
//                           NSForegroundColorAttributeName : [UIColor whiteColor]
//                           };
//    [self setTitleTextAttributes:dict];
//   
//}


@end
