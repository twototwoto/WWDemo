//
//  WWMainPageViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/16.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWMainPageViewController.h"
#import "WWDetailPageViewController.h"
#import "WWNavigationViewController.h"

@interface WWMainPageViewController ()

@end

@implementation WWMainPageViewController{
    UILabel *_label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareData];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
//    _label.center = self.view.center;
    
    WWLog(@"%f",self.view.frame.size.width);
}

- (void)prepareData{
    self.splitViewController.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated{
    //这里才能拿到正确的尺寸
    WWLog(@"%f",self.view.frame.size.width);
//    self.view.bounds = CGRectMake(WIDTH(0.2), 0, 0, 0);
//    _label.frame = CGRectMake(CGRectGetMidX(self.view.frame) - SCREEN_WIDTH * 0.2 - 50, SCREEN_HEIGHT * 0.5 - 50, 100, 100);
//    _label.frame = CGRectMake(self.view.bounds.size.width * 0.5, SCREEN_HEIGHT * 0.5, 100, 100);
//    _label.center = self.view.center;
//    _label.center = self.view.center;
//    _label.frame = CGRectMake(0, 0, 100, 40);
    
}

- (void)setupUI{
    
    WWLog(@"%f",self.view.frame.size.width);
    self.view.backgroundColor = [UIColor yellowColor];
    
    //MARK: - MARK: 一点关于使用SplitViewController的时候的视图的位置的问题
    /**
    *这样可以使得该视图的center相关属性正常化，不过，会使得从0开始的那种布局都跑到了整个屏幕的左上角去了
    *self.view.bounds = CGRectMake(WIDTH(0.2),0,SCREEN_WIDTH * 0.8, SCREEN_HEIGHT);
    *如果想用center相关的属性 使用Masonry来做是可以的
    */
    _label = [UILabel new];
    [self.view addSubview:_label];
    _label.text = @"MainPage";
    _label.backgroundColor = [UIColor redColor];
    _label.center = self.view.center;
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
//        make.left.right.top.bottom.equalTo(self.view);
    }];
    //这里用Masonry获取label的位置和尺寸都是0
    WWLog(@"%@",NSStringFromCGRect(_label.frame));
    //    _label.center = self.view.center;
    WWLog(@"%f",self.view.frame.size.width);
    
    UISwitch *switchV = [UISwitch new];
    [self.view addSubview:switchV];
    switchV.frame = CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame), 100, 40);
    switchV.frame = CGRectMake(0, 40, 100, 40);
    
    UIButton *btn = [UIButton new];
    [btn setTitle:@"改变导航栏的高度和item的位置Click Me" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(80, 40, 80, 40);
    [btn sizeToFit];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
}

#pragma mark - 点击btn
- (void)btnClick{
    
    WWDetailPageViewController *vc = [WWDetailPageViewController new];
    WWNavigationViewController *nav = [[WWNavigationViewController alloc]initWithRootViewController:vc];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.view.frame = CGRectMake(SCREEN_WIDTH * 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//    [self showViewController:nav sender:nil];
    [self presentViewController:nav animated:YES completion:nil];

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
