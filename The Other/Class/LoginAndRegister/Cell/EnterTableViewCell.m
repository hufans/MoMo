//
//  EnterTableViewCell.m
//  The Other
//
//  Created by 徐杨 on 2016/12/15.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "EnterTableViewCell.h"

@interface EnterTableViewCell()
{
    int times;
}

@property (nonatomic)UILabel *hintLabel;
@property (nonatomic)UIImageView *verticalLine;
@property (nonatomic)UITextField *inputField;
@property (nonatomic)UIImageView *bottomHorizontalLine;
@property (nonatomic)UIButton *operationButton;
@property (nonatomic)NSTimer *timer;

@end

@implementation EnterTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(enterCellType)type mode:(showMode)mode{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化属性
        self.backgroundColor = [UIColor clearColor];
        times = TimeInterval;
        
        switch (type) {
            case phoneType:{
                //区号
                self.hintLabel = [UILabel makeLabel:^(UILabel *make) {
                    make.labelTextAlignment(NSTextAlignmentCenter).labelFont([UIFont systemFontOfSize:15]).labelTextColor([UIColor whiteColor]).labelText(@"+86").labelAddToView(self.contentView);
                }];
                [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView);
                    make.left.equalTo(self.contentView);
                    make.bottom.equalTo(self.contentView);
                    make.width.mas_equalTo(HXFloat(60));
                }];
                //竖线分隔线
                self.verticalLine = [UIImageView makeImageView:^(UIImageView *make) {
                    make.ivBackgroundColor([UIColor whiteColor]).ivAddToView(self.contentView);
                }];
                [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView);
                    make.bottom.equalTo(self.contentView);
                    make.left.mas_equalTo(HXFloat(60));
                    make.width.mas_equalTo(@0.5);
                }];
                //手机号码输入框
                self.inputField = [UITextField makeTextField:^(UITextField *make) {
                    make.tfTintColor([UIColor whiteColor]).tfKeyboardType(UIKeyboardTypePhonePad).tfTextAlignment(NSTextAlignmentLeft).tfFont([UIFont systemFontOfSize:15]).tfTextColor([UIColor whiteColor]).tfAddToView(self.contentView);
                }];
                self.inputField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号码" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
                [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView);
                    make.left.equalTo(self.verticalLine.mas_right).with.offset(HXFloat(12));
                    make.bottom.equalTo(self.contentView);
                    make.right.equalTo(self.contentView).with.offset(HXFloat(-15));
                }];
                [self addBottomHorizontalLine];
                break;
            }
            case loginPwdType:{
                self.inputField = [UITextField makeTextField:^(UITextField *make) {
                    make.tfSecureTextEntry(true).tfTintColor([UIColor whiteColor]).tfTextAlignment(NSTextAlignmentLeft).tfFont([UIFont systemFontOfSize:15]).tfTextColor([UIColor whiteColor]).tfAddToView(self.contentView);
                }];
                self.inputField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
                [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView);
                    make.bottom.equalTo(self.contentView);
                    make.right.equalTo(self.contentView).with.offset(-HXFloat(15));
                    make.left.mas_equalTo(HXFloat(72.5));
                }];
                [self addBottomHorizontalLine];
                break;
            }
            case loginForgotPwdType:{
                self.operationButton = [UIButton makeButton:^(UIButton *make) {
                    make.btnTitleLableFont([UIFont systemFontOfSize:12]).btnTitleColor([UIColor whiteColor]).btnTitle(@"忘记密码？").btnAddToView(self.contentView);
                }];
                CGSize size = [Utils calculateStringSize:@"忘记密码？" font:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(SCREEN_WIDTH, 17)];
                [self.operationButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).with.offset(HXFloat(10));
                    make.right.equalTo(self.contentView);
                    make.size.mas_equalTo(size);
                }];
                break;
            }
            case buttonType:{
                self.operationButton = [UIButton makeButton:^(UIButton *make) {
                    make.btnLayerMasksToBounds(true).btnLayerCornerRadius(HXFloat(40)/2.0).btnBackgroundColor([UIColor whiteColor]).btnTitleLableFont([UIFont systemFontOfSize:15]).btnTitleColor(themeColor).btnTitle(@"登录").btnAddToView(self.contentView);
                }];
                [self.operationButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).with.offset(HXFloat(40));
                    make.left.equalTo(self.contentView);
                    make.right.equalTo(self.contentView);
                    make.height.mas_equalTo(HXFloat(40));
                }];
                break;
            }
            case codeType:{
                self.operationButton = [UIButton makeButton:^(UIButton *make) {
                    make.btnLayerMasksToBounds(true).btnLayerCornerRadius(30/2.0).btnAddTarget(self,@selector(sendCode),UIControlEventTouchUpInside).btnBackgroundColor([UIColor whiteColor]).btnTitleLableFont([UIFont systemFontOfSize:10]).btnTitleColor(themeColor).btnTitle(@"发送验证码").btnAddToView(self.contentView);
                }];
                CGSize size = [Utils calculateStringSize:@"59s后重新发送" font:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(SCREEN_WIDTH, 12)];
                [self.operationButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(self.contentView);
                    make.centerY.equalTo(self.contentView);
                    make.height.mas_equalTo(30);
                    make.width.mas_equalTo(size.width);
                }];
                
                self.inputField = [UITextField makeTextField:^(UITextField *make) {
                    make.tfKeyboardType(UIKeyboardTypePhonePad).tfTintColor([UIColor whiteColor]).tfTextAlignment(NSTextAlignmentLeft).tfFont([UIFont systemFontOfSize:15]).tfTextColor([UIColor whiteColor]).tfAddToView(self.contentView);
                }];
                self.inputField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
                [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView);
                    make.bottom.equalTo(self.contentView);
                    make.left.mas_equalTo(HXFloat(72.5));
                    make.right.equalTo(self.operationButton.mas_left).with.offset(-HXFloat(5));
                }];
                
                [self addBottomHorizontalLine];
                break;
            }
            case registerPwdType:{
                [self addInput:@"密码由6-10位数字和字母组成"];
                [self addBottomHorizontalLine];
                break;
            }
            case registerPwdAgainType:{
                [self addInput:@"请再次输入密码"];
                [self addBottomHorizontalLine];
                break;
            }
            case registerButtonType:{
                self.operationButton = [UIButton makeButton:^(UIButton *make) {
                    make.btnLayerMasksToBounds(true).btnLayerCornerRadius(HXFloat(40)/2.0).btnBackgroundColor([UIColor whiteColor]).btnTitleLableFont([UIFont systemFontOfSize:15]).btnTitleColor(themeColor).btnTitle(@"下一步").btnAddToView(self.contentView);
                }];
                [self.operationButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).with.offset(HXFloat(40));
                    make.left.equalTo(self.contentView);
                    make.right.equalTo(self.contentView);
                    make.height.mas_equalTo(HXFloat(40));
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
        make.ivBackgroundColor([UIColor whiteColor]).ivAddToView(self.contentView);
    }];
    [self.bottomHorizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(@0.5);
    }];
}

//添加输入框
- (void)addInput:(NSString *)placeholder{
    self.inputField = [UITextField makeTextField:^(UITextField *make) {
        make.tfSecureTextEntry(true).tfTintColor([UIColor whiteColor]).tfFont([UIFont systemFontOfSize:15]).tfTextAlignment(NSTextAlignmentLeft).tfTextColor([UIColor whiteColor]).tfAddToView(self.contentView);
    }];
    self.inputField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(HXFloat(16));
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.right.equalTo(self.contentView).with.offset(-HXFloat(16));
    }];
}

#pragma mark - 倒计时方法
- (void)timePass{
    if (times == TimeInterval) {
        [self.operationButton addAttribute:^(UIButton *make) {
            make.btnLayerBorderWidth(0.5f).btnLayerBorderColor([UIColor whiteColor]).btnBackgroundColor(themeColor).btnTitleColor([UIColor whiteColor]);
        }];
    }
    times--;
    if (times == 0) {
        [self.timer invalidate];
        self.timer = nil;
        [self.operationButton addAttribute:^(UIButton *make) {
            make.btnLayerBorderColor([UIColor whiteColor]).btnBackgroundColor([UIColor whiteColor]).btnTitleColor(themeColor).btnTitle(@"重新发送验证码");
        }];
        
    }else{
        [self.operationButton setTitle:[NSString stringWithFormat:@"%ds后重新发送",times] forState:(UIControlStateNormal)];
    }
}

#pragma mark - 协议方法
- (void)sendCode{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sendVerificationCode:)]) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timePass) userInfo:nil repeats:true];
        //控制器发送完验证码之后，开始倒计时
        [self.delegate sendVerificationCode:^{
            [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        }];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
