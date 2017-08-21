//
//  WWDetailPageViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/16.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWDetailPageViewController.h"
//#import "UINavigationBar+WWAdd.h"
//#import "WWNavigationBar.h"

@interface WWDetailPageViewController ()

@end

@implementation WWDetailPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark - 测试按钮的位置
- (void)testBtnPosition{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 0, 20, 20);
    WWLog(@"%zd",self.view.frame.size.width == SCREEN_WIDTH * 0.8);
    WWLog(@"%zd",self.view.frame.size.width == SCREEN_WIDTH);
    WWLog(@"%f",self.view.frame.size.width);
    WWLog(@"%f",SCREEN_WIDTH);
    WWLog(@"%f",SCREEN_WIDTH * 0.8);
    
    btn.frame = CGRectMake(self.view.bounds.size.width - 20, SCREEN_HEIGHT - 20, 20, 20);
    WWLog(@"%@",NSStringFromCGRect(btn.frame));
    btn.frame = CGRectMake(SCREEN_WIDTH - 20, SCREEN_HEIGHT - 20, 20, 20);
    WWLog(@"%@",NSStringFromCGRect(btn.frame));
    btn.frame = CGRectMake(WIDTH(0.8) - 20, SCREEN_HEIGHT - 20, 20, 20);
    
    
}
#pragma mark - 点击navigationBar的leftBarItem
- (void)leftBarButtonItemClick{
    WWLog(@"leftBarButtonItem");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark - 点击navigationBar的rightBarItem
- (void)rightBarButtonItemClick{
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor orangeColor];
    //在这里的这种modal出来的控制器下就可以push了
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self.navigationController pushViewController:vc animated:YES];
    WWLog(@"rightBarButtonItem");
}
#pragma mark - navigationBarUI
- (void)setupNavigationBarUI{
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    //如果是需要渐变的话就做下一行代码的处理 还需要更多的内部的代码的修改才可以
//    [(WWNavigationBar *)self.navigationController.navigationBar setNavigationBarStyle];
//    [self.navigationController.navigationBar setNavigationBarStyle];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    //改变返回的字体的颜色
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    
    //    self.navigationItem.title = @"detail";
    UILabel *navtitleLabel = [UILabel new];
    navtitleLabel.text = @"Title";
    navtitleLabel.frame = CGRectMake(0, 0, 80, 80);
    self.navigationItem.titleView = navtitleLabel;
    
    UIButton *rightBarButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    [rightBarButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    
    //如果有必要改变渲染模式
    //    rightBarButton.imageView.image = [rightBarButton.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    rightBarButton.backgroundColor = [UIColor orangeColor];
    [rightBarButton addTarget:self action:@selector(rightBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentMode = UIViewContentModeScaleToFill;
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];

}
- (void)setupUI{
    self.view.backgroundColor = [UIColor blueColor];
    
    [self setupNavigationBarUI];
    [self testBtnPosition];
    
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.frame = CGRectMake(100, 100, 100, 100);
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    label.text = @"DetailPage";
    
    
    
    
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
