//
//  SexTableViewCell.m
//  The Other
//
//  Created by 徐杨 on 2016/12/19.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "SexTableViewCell.h"

@interface SexTableViewCell()

@property (nonatomic) UIImageView *selectedImageView;
@property (nonatomic) UIImageView *bottomHorizontalLine;
@property (nonatomic) BOOL isSelectedCell;

@end

@implementation SexTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title selected:(BOOL)selected{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.text = title;
        self.isSelectedCell = selected;
        if (selected) {
            [self showSelectedImageView];
        }
        [self addBottomHorizontalLine];
    }
    return self;
}

///设置选中或者非选中状态
- (void)setCellSelected:(BOOL)selected{
    if (selected) {
        if (!self.isSelectedCell) {//如果当前cell为非选中状态时，置为选中状态
            [self showSelectedImageView];
        }
    }else{
        [self.selectedImageView removeFromSuperview];
    }
}

///添加底部分隔线
- (void)addBottomHorizontalLine{
    //底部分隔线
    self.bottomHorizontalLine = [UIImageView makeImageView:^(UIImageView *make) {
        make.ivBackgroundColor(RGB(200, 199, 204, 1.0)).ivAddToView(self.contentView);
    }];
    [self.bottomHorizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(@0.5);
    }];
}

///选中图片
- (void)showSelectedImageView{
    self.selectedImageView = [UIImageView makeImageView:^(UIImageView *make) {
        make.ivimage([UIImage imageNamed:@"code-pass"]).ivAddToView(self.contentView);
    }];
    [self.selectedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-20);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(HXCGSizeMake(24, 24));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
