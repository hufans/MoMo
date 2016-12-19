//
//  RegisterTableViewCell.m
//  The Other
//
//  Created by 徐杨 on 2016/12/16.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "RegisterTableViewCell.h"
#import "TagButton.h"

@interface RegisterTableViewCell()<TagButtonDelegate>

@property (nonatomic) UIImageView *bottomHorizontalLine;
@property (nonatomic) UILabel *hintLabel;
@property (nonatomic) UIImageView *accessoryImageView;
@property (nonatomic) UIView *containerView;
@property (nonatomic) UIButton *confirmButton;
///值的数组
@property (nonatomic) NSMutableArray<NSString *> *valueArray;

@end

@implementation RegisterTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(RegisterCellType)type{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //值数组初始化
        self.valueArray = [NSMutableArray array];
        switch (type) {
            case nameType:{//姓名
                self.inputField = [UITextField makeTextField:^(UITextField *make) {
                    make.tfTintColor([UIColor blackColor]).tfTextAlignment(NSTextAlignmentCenter).tfFont([UIFont systemFontOfSize:15]).tfTextColor([UIColor blackColor]).tfAddToView(self.contentView);
                }];
                self.inputField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入您的名字" attributes:@{NSForegroundColorAttributeName:RGB(157, 157, 157, 1.0)}];
                [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(HXFloat(20));
                    make.right.mas_equalTo(-HXFloat(20));
                    make.top.equalTo(self.contentView).with.offset(3);
                    make.bottom.equalTo(self.contentView).with.offset(-3);
                }];
                [self addBottomHorizontalLine];
                break;
            }
            case sexType:{//性别
                [self selectCell:@"请选择您的性别"];
                break;
            }
            case birthdayType:{
                [self selectCell:@"请设置您的生日"];
                break;
            }
            case likeStyleType:{
                [self selectCell:@"请选择您喜欢的对象性别"];
                break;
            }
            case tagType:{
                //提示语
                self.hintLabel = [UILabel makeLabel:^(UILabel *make) {
                    make.labelTextAlignment(NSTextAlignmentCenter).labelTextColor(themeColor).labelText(@"请从以下三个标签中，选出三个最适合您的").labelFont([UIFont systemFontOfSize:15]).labelNumberOfLines(0).labelAddToView(self.contentView);
                }];
                [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).with.offset(HXFloat(20));
                    make.left.equalTo(self.contentView).with.offset(HXFloat(102));
                    make.right.equalTo(self.contentView).with.offset(-HXFloat(102));
                }];
                //标签父控件
                self.containerView = [UIView makeView:^(UIView *make) {
                    make.viewBackgroundColor([UIColor whiteColor]).viewAddToView(self.contentView);
                }];
                //创建所有标签的按钮，并返回父控件需要的高度
                CGFloat needHeight = [self createTagButton:self.containerView];
                [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.hintLabel.mas_bottom);
                    make.left.equalTo(self.contentView);
                    make.right.equalTo(self.contentView);
                    make.height.mas_equalTo(needHeight);
                }];
                //下一步按钮
                self.confirmButton = [UIButton makeButton:^(UIButton *make) {
                    make.btnAddTarget(self,@selector(nextStep),UIControlEventTouchUpInside).btnLayerBorderWidth(0.5).btnLayerBorderColor(themeColor).btnLayerCornerRadius(HXFloat(40)/2.0).btnBackgroundColor([UIColor whiteColor]).btnTitleLableFont([UIFont systemFontOfSize:15]).btnTitleColor(themeColor).btnTitle(@"下一步").btnAddToView(self.contentView);
                }];
                [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.containerView.mas_bottom).offset(HXFloat(30));
                    make.centerX.equalTo(self.contentView);
                    make.size.mas_equalTo(HXCGSizeMake(320, 40));
                }];
                break;
            }
        }
    }
    return self;
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

///添加右侧的Accessory
- (void)addAccessory{
    self.accessoryImageView = [UIImageView makeImageView:^(UIImageView *make) {
        make.ivimage([UIImage imageNamed:@"Disclosure Indicator"]).ivAddToView(self.contentView);
    }];
    
    [self.accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(8, 13));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).with.offset(-HXFloat(16));
    }];
}

///选择项
- (void)selectCell:(NSString *)placeholder{
    self.hintLabel = [UILabel makeLabel:^(UILabel *make) {
        make.labelTextAlignment(NSTextAlignmentCenter).labelFont([UIFont systemFontOfSize:15]).labelTextColor(RGB(157, 157, 157, 1.0)).labelText(placeholder).labelAddToView(self.contentView);
    }];
    [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).with.offset(3);
        make.bottom.equalTo(self.contentView).with.offset(-3);
    }];
    [self addAccessory];
    [self addBottomHorizontalLine];
}

///标签按钮
- (CGFloat)createTagButton:(UIView *)parentView{
    NSArray *titleArray = @[@"健身",@"萝莉控",@"御姐控",@"大叔控",@"科技党",@"美食专家",@"程序员",@"小基佬",@"死宅",@"宠物控",@"旅行",@"动漫"];
    NSMutableArray<TagButton *> *tagArray = [NSMutableArray array];
    for (int i=0; i<titleArray.count; i++) {
        TagButton *tag = [TagButton makeTagButton:^(TagButton *make) {
            make.btnTitleColor(themeColor).btnBackgroundColor([UIColor whiteColor]).btnTitleLableFont([UIFont systemFontOfSize:15]).btnTitle(titleArray[i]).btnAddToView(parentView);
        }];
        tag.tag = i;//设置按钮tag值
        tag.delegate = self;
        [tagArray addObject:tag];
    }
    return [TagButton groupAndAlign:parentView andViews:tagArray andRowSpace:HXFloat(15) andColumnSpace:HXFloat(15)];
}

#pragma mark - 标签按钮的代理方法
- (void)selectTagAction:(int)index andTagButton:(TagButton *)btn{
    if (!btn.isSelected) {
        if (self.valueArray.count < 3) {
            [self.valueArray addObject:btn.titleLabel.text];
            //确认选中
            [btn setSelected:!self.isSelected];
        }else{
            NSLog(@"RegisterTableViewCell提示：最多只能选择3个");
        }
    }else{
        //比较标签是否已经存在，如果存在，则移除并且返回true
        if ([self compareText:btn.titleLabel.text]) {
            //取消选中
            [btn setSelected:self.isSelected];
        }
    }
}

#pragma mark - 比较标签是否已经存在，如果存在，则移除并且返回true
- (BOOL)compareText:(NSString *)text{
    for (int i=0; i<self.valueArray.count; i++) {
        if ([self.valueArray[i] isEqualToString:text]) {
            [self.valueArray removeObjectAtIndex:i];
            return true;
        }
    }
    return false;
}

#pragma mark - 设置提示文本
- (void)setHintLabelText:(NSString *)text{
    self.hintLabel.textColor = [UIColor blackColor];
    self.hintLabel.text = text;
}

#pragma mark - 注册下一步调用代理方法
- (void)nextStep{
    if (self.delegate && [self.delegate respondsToSelector:@selector(registerNextStep2)]) {
        [self.delegate registerNextStep2];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
