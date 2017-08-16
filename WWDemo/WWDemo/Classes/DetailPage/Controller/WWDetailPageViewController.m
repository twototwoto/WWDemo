//
//  WWDetailPageViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/16.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWDetailPageViewController.h"

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
- (void)setupUI{
    self.view.backgroundColor = [UIColor blueColor];
    [self testBtnPosition];
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
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
