//
//  AppDelegate.m
//  WWDemo
//
//  Created by Live on 2017/8/9.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "AppDelegate.h"
#import "WWMainViewController.h"
#import "WWDetailViewController.h"

//Master占总的屏幕的宽度的比例系数
static const double kMasterColumnWidthFraction = 0.2;

@interface AppDelegate ()<UISplitViewControllerDelegate>

@property (nonatomic,strong) UISplitViewController *splitViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    return YES;
    self.splitViewController = [UISplitViewController new];
    WWMainViewController *masterVc = [WWMainViewController new];
    WWDetailViewController *detailVc = [WWDetailViewController new];
    UINavigationController *masterNavC = [[UINavigationController alloc]initWithRootViewController:masterVc];
    UINavigationController *detailNavC = [[UINavigationController alloc]initWithRootViewController:detailVc];
    /*  在下一行代码之前不要对splitViewController设置任何属性 否则的话可能报警告 警告如下:2017-08-21 11:26:59.657028+0800 WWDemo[3868:112940] [Warning] Splitview controller <UISplitViewControllerClassicImpl: 0x7fc715305130> is expected to have a view controller at index 0 before it's used!
     */
    self.splitViewController.viewControllers = @[masterNavC,detailNavC];
    //总是能够展示出来视图
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    
    masterVc.navigationItem.title = @"Master";
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"Master" style:UIBarButtonItemStyleDone target:self action:@selector(showMaster)];
    detailVc.navigationItem.leftBarButtonItem = barBtnItem;
//    detailVc.navigationItem.leftBarButtonItem.title = @"Master";
    
    //隐藏导航栏
    masterNavC.navigationBar.hidden = YES;
    detailNavC.navigationBar.hidden = YES;
    //全局隐藏状态栏
    [UIApplication sharedApplication].statusBarHidden = YES;
    
//    self.splitViewController.viewControllers = @[masterNavC,detailNavC];
    self.splitViewController.delegate = self;
    
    //当需要设置splitViewController的Master的宽度比较大的时候 上边的代码是必须的
    self.splitViewController.maximumPrimaryColumnWidth = MAXFLOAT;
    //当需要改变splitViewController的Master和Detail的视图的宽度的时候 需要下列属性 按照一个比例来设置
    self.splitViewController.preferredPrimaryColumnWidthFraction = kMasterColumnWidthFraction;
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.splitViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -<UISplitViewController>
//主控制器将要隐藏时触发的方法
-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"Master";
    //master将要隐藏时，给detail设置一个返回按钮
    UINavigationController *Nav = [self.splitViewController.viewControllers lastObject];
    WWDetailViewController *detailVc = (WWDetailViewController *)[Nav topViewController];
    
    detailVc.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode NS_AVAILABLE_IOS(8_0){
    
    //上边的方法废弃了用这个
    //其实现在不需要这个方法的 只需要使用手势就可以展示出来Master
    UINavigationController *nav = [self.splitViewController.viewControllers lastObject];
    WWDetailViewController *detailVc = (WWDetailViewController *)[nav topViewController];
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"Master" style:UIBarButtonItemStylePlain target:self action:@selector(showMaster)];
    detailVc.navigationItem.leftBarButtonItem = barBtnItem;
    //直接写不行 可能是因为要给相应的barButtonItem需要指定targetSelector的原因
//    detailVc.navigationItem.leftBarButtonItem.title = @"Master";
}

#pragma mark - 展示Master
- (void)showMaster{
    //展示出来Master 可以通过模仿手势来实现展示出来Master
    
}

#pragma mark - 开始时取消二级控制器,只显示详细控制器
- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    return NO;
}


//主控制器将要显示时触发的方法
-(void)splitViewController:(UISplitViewController *)sender willShowViewController:(UIViewController *)master invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    //master将要显示时,取消detail的返回按钮
    UINavigationController *Nav = [self.splitViewController.viewControllers lastObject];
    WWDetailViewController *detailVc = (WWDetailViewController *)[Nav topViewController];
    
    detailVc.navigationItem.leftBarButtonItem = nil;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"WWDemo"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
