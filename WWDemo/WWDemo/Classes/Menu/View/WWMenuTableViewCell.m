//
//  WWMenuTableViewCell.m
//  WWDemo
//
//  Created by Live on 2017/8/14.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWMenuTableViewCell.h"

@implementation WWMenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - 代码方式自定义Cell要调用的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupMenuCellUI];
    }
    return self;
}


#pragma mark - 初始化WWMenuCell的UI
- (void)setupMenuCellUI{
    
    CGFloat halfCellH = SCREEN_HEIGHT * 0.125;
    self.backgroundColor = [UIColor orangeColor];
    //取消cell的选中的样式
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    [self.contentView addSubview:self.menuItemLabel];
    [self.contentView addSubview:self.menuItemImageView];
    
    [self.menuItemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(halfCellH);
    }];
    [self.menuItemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.menuItemImageView.mas_bottom);
        
    }];
    
}

#pragma mark - 懒加载
- (UIImageView *)menuItemImageView{
    if (!_menuItemImageView) {
        _menuItemImageView = [UIImageView new];
        [self.contentView addSubview:_menuItemImageView];
        _menuItemImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _menuItemImageView;
}

- (UILabel *)menuItemLabel{
    if (!_menuItemLabel) {
        _menuItemLabel = [UILabel new];
        _menuItemLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _menuItemLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
