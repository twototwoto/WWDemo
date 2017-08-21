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

static NSString *const kLockReuseIdentifierStr = @"kLockReuseIdentifierStr";

static const CGFloat kPerRowItemNumbers = 4;
@interface WWMainPageViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation WWMainPageViewController{
    UILabel *_label;
    CGFloat _kLeftRightMargin;
    CGFloat _kSectionTopBottomMargin;
    CGFloat _kColumnMargin;
    CGFloat _kRowMargin;
    CGSize _kItemSize;
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
    
    _kLeftRightMargin = WIDTH(0.05);
    _kSectionTopBottomMargin = HEIGHT(0.05);
    _kColumnMargin = HEIGHT(0.1);
    _kRowMargin = WIDTH(0.1);
    _kItemSize = CGSizeMake(WIDTH(0.1), HEIGHT(0.1));
    
    CGFloat itemWidth = (WIDTH(0.7) - ((kPerRowItemNumbers - 1) *_kColumnMargin) - (_kLeftRightMargin * 2))/kPerRowItemNumbers;
    CGFloat itemHeight = HEIGHT(0.1);
    _kItemSize = CGSizeMake(itemWidth, itemHeight);
    
    
    
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
    self.view.backgroundColor = [UIColor redColor];
    
    UIImageView *bgImgV = [UIImageView new];
    bgImgV.image = [UIImage imageNamed:@"water"];
    [self.view addSubview:bgImgV];
    [bgImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    
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
    
    [self setupGateCollectionView];
    
}

- (void)setupGateCollectionView{
    self.gateCollectionView.backgroundColor = WWRGBAColor(0, 0, 255.0, 0.2);
}

#pragma mark - 点击btn
- (void)btnClick{
    
    WWDetailPageViewController *vc = [WWDetailPageViewController new];
    WWNavigationViewController *nav = [[WWNavigationViewController alloc]initWithRootViewController:vc];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.view.frame = CGRectMake(SCREEN_WIDTH * 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//    [self showViewController:nav sender:nil];
    [self presentViewController:nav animated:YES completion:nil];

}

#pragma mark - @protocol UICollectionViewDelegateFlowLayout <UICollectionViewDelegate>
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, HEIGHT(0.1), 0, 0);
    WWLog(@"gaodu---%f",HEIGHT(0.05));
    WWLog(@"kuandu--%f",WIDTH(0.05));
//    return UIEdgeInsetsMake(HEIGHT(0.05), WIDTH(0.05), HEIGHT(0.05), WIDTH(0.05));
    return UIEdgeInsetsMake(_kSectionTopBottomMargin, _kLeftRightMargin, _kSectionTopBottomMargin, _kLeftRightMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return _kRowMargin;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return _kColumnMargin;
}

#pragma mark - 设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    return CGSizeMake(WIDTH(0.1), HEIGHT(0.1));
    return _kItemSize;
//    return CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
    
}


#pragma mark - @protocol UICollectionViewDataSource <NSObject>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kLockReuseIdentifierStr forIndexPath:indexPath];
    UIImageView *lockImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lock_normal"]];
     UIImageView *lockSelImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lock_sel"]];
    cell.backgroundView = lockImgV;
    cell.selectedBackgroundView = lockSelImgV;
    cell.backgroundColor = [UIColor whiteColor];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:cell.contentView.bounds];
    //目前只是简单的用的系统的cell 再自定义的话以后想写在写
    UILabel *label = [UILabel new];
    label.center = cell.contentView.center;
    label.backgroundColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%zd-%zd",indexPath.section,indexPath.item];
    [label sizeToFit];
    [cell.contentView addSubview:label];
    
    return cell;
}



#pragma mark - 懒加载
- (UICollectionView *)gateCollectionView{
    if (!_gateCollectionView) {

        UICollectionViewFlowLayout *flowlayout = [UICollectionViewFlowLayout new];
        _gateCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(WIDTH(0.05),HEIGHT(0.15),WIDTH(0.7),HEIGHT(0.8)) collectionViewLayout:flowlayout];
        _gateCollectionView.delegate = self;
        [_gateCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kLockReuseIdentifierStr];
        _gateCollectionView.delegate = self;
        _gateCollectionView.dataSource = self;
        [self.view addSubview:_gateCollectionView];
    }
    return _gateCollectionView;
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
