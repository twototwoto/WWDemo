//
//  ViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/9.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController{
    UIWebView *_webView;
}

- (void)setupUI{
    _webView = [[UIWebView alloc]init];
    [self.view addSubview:_webView];
    _webView.frame = self.view.bounds;
    
    _webView.delegate = self;
    NSString *str = @"https://www.baidu.com";
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    
}

#pragma mark - 处理请求
- (void)handleRequestWithURLStr:(NSString *)requetStr{
    
//    if ([requetStr hasPrefix:@"itms-appss"]){
        if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"JSOC://"]]) {
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"JSOC://"] options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@YES} completionHandler:^(BOOL success) {
                WWLog(@"打开App回调完成");
            }];
            
//            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:requetStr] options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@YES} completionHandler:^(BOOL success) {
//                NSLog(@"打开App回调完成");
////                SplitVcDemo
//            }];
            
//        }
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    if(navigationType == UIWebViewNavigationTypeLinkClicked){
        NSLog(@"点击了按钮");
        NSLog(@"%@",request.URL);
    }
    [self handleRequestWithURLStr:request.URL.absoluteString];
    return YES;
}

#pragma mark - 设置toast
- (void)testToast{
    
    CSToastStyle *style = [[CSToastStyle alloc]initWithDefaultStyle];
    //    style.messageColor = [UIColor blueColor];
    
    [self.view makeToast:@"toast" duration:1.0 position:CSToastPositionBottom title:@"toastTitle" image:[UIImage imageNamed:@"toaster"] style:style completion:^(BOOL didTap) {
        WWLog(@"1.0S后要执行的操作");
    }];

}

#pragma mark - 测试宏
- (void)testMacro{
    
    WWNetworkShowActivityIndicator();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        WWNetworkHideActivityIndicator();
    });

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self testToast];
    [self testMacro];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
