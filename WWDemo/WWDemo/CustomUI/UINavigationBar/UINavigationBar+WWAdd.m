//
//  UINavigationBar+WWAdd.m
//  WWDemo
//
//  Created by Live on 2017/8/17.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "UINavigationBar+WWAdd.h"

//重置y
static const CGFloat kOriginY = 40.0f;
static CGFloat const kDefaultColorLayerOpacity = 0.5f;
static CGFloat const kSpaceToCoverStatusBars = 20.0f;

@implementation UINavigationBar (WWAdd)

-(void)setBarTintColor:(UIColor *)barTintColor{
    
}

- (CGSize)sizeThatFits:(CGSize)size{
//    self.barTintColor = [UIColor redColor];
    CGSize newSize = [super sizeThatFits:size];
    
//    newSize.height += 5;
    //这个方法会调用多次 所以用的定值写死了
    newSize.height = 100;
//    CGSize newSize = CGSizeMake(self.frame.size.width, 200);
    return newSize;
}




//
- (void)layoutSubviews {
    //FIXME: - FIXME: 如果是想要用分类来改变item的高度的话 如果是重写了layoutSubViews NavigationBar的背景色就没了 所以有需要的话暂时还是先用新建子类 继承的方式来做

    [super layoutSubviews];
    WWLog(@"%@",self.barTintColor);
//    if (self.barTintColor == NULL) {
//        self.barTintColor = [UIColor redColor];
//        CALayer *layer = [CALayer new];
//        layer.opacity = 0.8;
//        layer.backgroundColor = [UIColor redColor].CGColor;
//        [self.layer addSublayer:layer];
//    }
//    self.barTintColor = [UIColor redColor];
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100.0f);
    
    UINavigationItem *navigationItem = [self topItem];
    
    for (UIView *subview in [self subviews]) {
        
        if (subview == [[navigationItem rightBarButtonItem] customView]) {
            
            CGRect rect = subview.frame;
            rect.origin.y = kOriginY;
//            rect.origin.y -= subview.frame.size.height * 0.5;
            subview.frame = rect;
        }
        else if (subview == [[navigationItem backBarButtonItem] customView]) {
            
            CGRect rect = subview.frame;
//            rect.origin.y -= subview.frame.size.height * 0.5;
            rect.origin.y = kOriginY;
            subview.frame = rect;
            
        }
    }
    return;
}

@end
