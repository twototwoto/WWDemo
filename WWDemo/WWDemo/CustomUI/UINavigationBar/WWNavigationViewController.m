//
//  WWNavigationViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/17.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWNavigationViewController.h"
#import "WWNavigationBar.h"

@interface WWNavigationViewController ()

@end

@implementation WWNavigationViewController



- (id)init {
    self = [super initWithNavigationBarClass:[WWNavigationBar class] toolbarClass:nil];
    if(self) {
        // Custom initialization here, if needed.
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithNavigationBarClass:[WWNavigationBar class] toolbarClass:nil];
    if(self) {
        self.viewControllers = @[rootViewController];
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
