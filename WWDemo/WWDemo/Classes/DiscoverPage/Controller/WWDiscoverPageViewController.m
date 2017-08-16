//
//  WWDiscoverPageViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/16.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWDiscoverPageViewController.h"

@interface WWDiscoverPageViewController ()

@end

@implementation WWDiscoverPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:label];
    label.text = @"DiscoverPage";
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
