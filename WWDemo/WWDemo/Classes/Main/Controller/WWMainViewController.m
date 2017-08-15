//
//  WWMainViewController.m
//  WWDemo
//
//  Created by Live on 2017/8/10.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWMainViewController.h"
#import "WWMenuTableViewCell.h"

//指定菜单的item的个数
static const NSInteger kMenuItemsCount = 4;
static NSString *kMenuTableViewCellReuseIdentifierStr = @"kMenuTableViewCellReuseIdentifierStr";


@interface WWMainViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WWMainViewController{
    NSArray<NSString *> *_menuLabelStrArr;
    NSArray<NSString *> *_menuNormalImageStrArr;
    NSArray<NSString *> *_menuSelectedImageStrArr;
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
}

#pragma mark - 处理UI
- (void)setupUI{
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.menuTableView];
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
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuTableView.bounces = NO;
//        _menuTableView.allowsSelection = NO;
    }
    return _menuTableView;
    
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
