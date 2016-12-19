//
//  BirthdayViewController.m
//  The Other
//
//  Created by 徐杨 on 2016/12/19.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "BirthdayViewController.h"

@interface BirthdayViewController ()

@property (nonatomic) UIDatePicker *birthdayPickerView;
@property (nonatomic) UIButton *completeButton;

@end

@implementation BirthdayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:RGB(245, 245, 245, 1.0)];
    
    [self addCompleteButton];
    [self pickViewSettings];
}

#pragma mark - 添加完成按钮
- (void)addCompleteButton{
    self.completeButton = [UIButton makeButton:^(UIButton *make) {
        make.btnAddTarget(self,@selector(complete:),UIControlEventTouchUpInside).btnTitleColor(themeColor).btnTitleLableFont([UIFont systemFontOfSize:14]).btnTitle(@"完成").btnBackgroundColor(RGB(245, 245, 245, 1.0)).btnAddToView(self.view);
    }];
    
    [self.completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(5);
        make.right.equalTo(self.view).with.offset(-5);
        make.size.mas_equalTo(HXCGSizeMake(60, 30));
    }];
}

#pragma mark - 完成按钮
- (void)complete:(UIButton *)sender{
    if (self.chooseComplete != nil) {
        self.chooseComplete(self.birthdayPickerView.date);
    }
}

#pragma mark - UIPickerView设置
- (void)pickViewSettings{
    self.birthdayPickerView = [[UIDatePicker alloc] init];
    //设置日期选择控件的地区,中国地区标识是："zh_Hans_CN"或者"zh_CN"
    [self.birthdayPickerView setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    //设置时区
    [self.birthdayPickerView setTimeZone:[NSTimeZone localTimeZone]];
    //设置当前显示日期
    [self.birthdayPickerView setDate:[NSDate date] animated:true];
    // 设置显示最大时间（此处为当前时间）
    [self.birthdayPickerView setMaximumDate:[NSDate date]];
    // 设置UIDatePicker的显示模式
    [self.birthdayPickerView setDatePickerMode:UIDatePickerModeDate];
    [self.view addSubview:self.birthdayPickerView];
    
    [self.birthdayPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    [self.birthdayPickerView addTarget:self action:@selector(dateChooseComplete:) forControlEvents:(UIControlEventValueChanged)];
}

#pragma mark - 值改变时的方法
- (void)dateChooseComplete:(UIDatePicker *)picker{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
