//
//  WWMainViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/10.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWMainViewController.h"

#import "WWMainPageViewController.h"
#import "WWDetailPageViewController.h"
#import "WWDiscoverPageViewController.h"
#import "WWMinePageViewController.h"

#import "WWMenuTableViewCell.h"

typedef NS_ENUM(NSUInteger,ViewControllerType){
    ViewControllerTypeMain,
    ViewControllerTypeDetail,
    ViewControllerTypeDiscover,
    ViewControllerTypeMine
};

//指定菜单的item的个数
static const NSInteger kMenuItemsCount = 4;
static NSString *kMenuTableViewCellReuseIdentifierStr = @"kMenuTableViewCellReuseIdentifierStr";


@interface WWMainViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WWMainViewController{
    NSArray<NSString *> *_menuLabelStrArr;
    NSArray<NSString *> *_menuNormalImageStrArr;
    NSArray<NSString *> *_menuSelectedImageStrArr;
    //记录上次选中的行
    NSInteger _selectedRow;
    //主视图的名称数组
    NSArray<NSString *> *_detailViewControllerArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareData];
    [self setupUI];
}

#pragma mark - 准备数据
- (void)prepareData{
    _menuLabelStrArr = @[@"首页",@"详情",@"发现",@"我的"];
    _menuNormalImageStrArr = @[@"main",@"book",@"discover",@"mine"];
    _menuSelectedImageStrArr = @[@"main_Sel",@"book_Sel",@"discover_Sel",@"mine_Sel"];
    _detailViewControllerArr = @[@"WWMainPageViewController",@"WWDetailPageViewController",@"WWDiscoverPageViewController",@"WWMinePageViewController"];
    
    _selectedRow = 1;
}


#pragma mark - 展示出来详情控制器
- (void)showViewControllerWithSelectedCell:(NSInteger)selectedIndex{
    
    UIViewController *detailVc = [self.detailVcCacheDictM valueForKey:_menuLabelStrArr[selectedIndex]];
    if (detailVc) {
        [self.splitViewController showDetailViewController:detailVc sender:nil];
    }else{
        detailVc = [NSClassFromString(_detailViewControllerArr[selectedIndex]) new];
        //控制器缓存
        [self.detailVcCacheDictM setObject:detailVc forKey:_menuLabelStrArr[selectedIndex]];
    }
    [self.splitViewController showDetailViewController:detailVc sender:nil];

}

#pragma mark - 处理UI
- (void)setupUI{
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.menuTableView];
    //设置cell的行高
    self.menuTableView.rowHeight = SCREEN_HEIGHT / kMenuItemsCount ;
//    self.menuTableView.estimatedRowHeight = SCREEN_HEIGHT * 0.25
    
    //默认选中第一个cell的操作
    [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.menuTableView.delegate tableView:self.menuTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    
    

    
    
    
}

#pragma mark - @protocol UITableViewDataSource<NSObject>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return kMenuItemsCount;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WWMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMenuTableViewCellReuseIdentifierStr];
    cell.menuItemLabel.text = _menuLabelStrArr[indexPath.row];
    [cell.menuItemImageView setImage:[UIImage imageNamed:_menuNormalImageStrArr[indexPath.row]]];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_selectedRow == indexPath.row) {
        return;
    }
    _selectedRow = indexPath.row;
    //对所有的cell进行重置操作
    for (NSInteger i = 0; i < kMenuItemsCount; i ++) {
        WWMenuTableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [cell.menuItemImageView setImage:[UIImage imageNamed:_menuNormalImageStrArr[i]]];
        cell.menuItemLabel.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor orangeColor];
    }
    
    //选中操作
    WWMenuTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.menuItemImageView setImage:[UIImage imageNamed:_menuSelectedImageStrArr[indexPath.row]]];
    //别写错额，
//    cell.imageView.image = [UIImage imageNamed:_menuSelectedImageStrArr[indexPath.row]];
    cell.backgroundColor = [UIColor purpleColor];
    cell.menuItemLabel.textColor = [UIColor whiteColor];
    
    [self showViewControllerWithSelectedCell:indexPath.row];

//    if (indexPath.row % 2) {
//        [self.splitViewController showViewController:[WWDetailPageViewController new] sender:nil];
//        
//    }else{
//    
//        [self.splitViewController showViewController:[WWMainPageViewController new] sender:nil];
//    }
    
    
}



#pragma mark - 懒加载
- (UITableView *)menuTableView{
    
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _menuTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.2, SCREEN_HEIGHT);
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        [_menuTableView registerClass:[WWMenuTableViewCell class] forCellReuseIdentifier:kMenuTableViewCellReuseIdentifierStr];
        //去除cell的分割样式
//        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuTableView.bounces = NO;
//        _menuTableView.allowsSelection = NO;
    }
    return _menuTableView;
    
}

- (NSMutableDictionary *)detailVcCacheDictM{
    if (!_detailVcCacheDictM) {
        _detailVcCacheDictM = [NSMutableDictionary dictionary];
    }
    return _detailVcCacheDictM;
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
