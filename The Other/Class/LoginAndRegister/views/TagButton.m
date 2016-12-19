//
//  TagButton.m
//  The Other
//
//  Created by 徐杨 on 2016/12/19.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "TagButton.h"

@interface TagButton()

@end

@implementation TagButton

#pragma mark - 初始化方法
+ (TagButton *)makeTagButton:(void (^)(TagButton *))make{
    TagButton *tag = [[TagButton alloc] init];
    make(tag);
    return tag;
}

#pragma mark - 布局控件获取视图尺寸
- (void)layoutSubviews{
    [super layoutSubviews];
    self.afterLayoutFrame = self.frame;
    self.layer.cornerRadius = self.frame.size.height/2.0;
    self.layer.masksToBounds = true;
    self.layer.borderColor = themeColor.CGColor;
    self.layer.borderWidth = 0.5;
    [self addTarget:self action:@selector(chooseTagAction:andTagButton:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        self.backgroundColor = themeColor;
        [self setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }else{
        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:themeColor forState:(UIControlStateNormal)];
    }
}

#pragma mark - 按照多行多列的规则布局视图
+ (CGFloat)groupAndAlign:(UIView *)parentView andViews:(NSArray<TagButton *> *)views andRowSpace:(CGFloat)rowSpace andColumnSpace:(CGFloat)columnSpace{
    if (views.count == 0 || parentView == nil) {
        NSLog(@"groupAndAlign方法参数错误");
        return 0;
    }
    ///先记录第一个view
    TagButton *lastView = views[0];
    ///用来记录每一行最后一个控件的MaxX
    CGFloat maxXOfRow = 0;
    ///用来记录行数的变量
    int rows = 1;
    for (int i=0; i<views.count; i++) {
        if (i == 0) {//第一个视图
            //计算视图需要的宽高
            CGSize size = [lastView getHeightAndWidth];
            [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(parentView).with.offset(rowSpace);
                make.left.equalTo(parentView).with.offset(columnSpace);
                make.size.mas_equalTo(size);
            }];
            [lastView layoutIfNeeded];//更新视图
            //记录最大X值
            maxXOfRow = lastView.afterLayoutFrame.size.width + columnSpace;
        }else{//非第一个视图
            CGSize size = [views[i] getHeightAndWidth];
            //上一个视图的maxX
//            CGFloat lastViewMaxX = CGRectGetMaxX(lastView.afterLayoutFrame);
            //判断上一个视图的右侧宽度是否够当前视图的排列
            if (SCREEN_WIDTH - maxXOfRow > (size.width + 2*columnSpace)) {
                //将当前视图放在上一个视图的右侧
                [views[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(lastView);
                    make.left.equalTo(lastView.mas_right).with.offset(columnSpace);
                    make.size.mas_equalTo(size);
                }];
                [views[i] layoutIfNeeded];//更新视图
                //记录最大X值 += 当前视图宽 + 列间距
                maxXOfRow += views[i].afterLayoutFrame.size.width + columnSpace;
            }else{//如果不够，则换行
                rows++;
                [views[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(lastView.mas_bottom).with.offset(rowSpace);
                    make.left.equalTo(parentView).with.offset(columnSpace);
                    make.size.mas_equalTo(size);
                }];
                [views[i] layoutIfNeeded];//更新视图
                //记录最大X值
                maxXOfRow = views[i].afterLayoutFrame.size.width;
            }
            //把当前视图置为上一个视图
            lastView = views[i];
        }
    }
    //返回父视图需要的高度 = 按钮高度30 * 总行数 + 行间距*(总行数+1)
    return 30*rows + rowSpace*(rows + 1);
}

///根据按钮的title获取按钮的尺寸
- (CGSize)getHeightAndWidth{
    CGSize size = CGSizeMake(70, 30);
    if (self.titleLabel.text.length > 0) {
        CGSize textSize = [Utils calculateStringSize:self.titleLabel.text font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(SCREEN_WIDTH, HXFloat(30))];
        size.width = textSize.width + 2*HXFloat(15);
    }
    return size;
}

#pragma mark - 按钮点击事件
- (void)chooseTagAction:(UIButton *)sender andTagButton:(TagButton *)btn{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(selectTagAction:andTagButton:)]) {
        [self.delegate selectTagAction:(int)sender.tag andTagButton:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
