//
//  ViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/9.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CSToastStyle *style = [[CSToastStyle alloc]initWithDefaultStyle];
//    style.messageColor = [UIColor blueColor];
    
    [self.view makeToast:@"toast" duration:1.0 position:CSToastPositionBottom title:@"toastTitle" image:[UIImage imageNamed:@"toaster"] style:style completion:^(BOOL didTap) {
        WWLog(@"1.0S后要执行的操作");
    }];
    
    WWNetworkShowActivityIndicator();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        WWNetworkHideActivityIndicator();
    });
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
