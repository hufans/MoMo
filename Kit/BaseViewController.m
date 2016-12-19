//
//  BaseViewController.m
//  The Other
//
//  Created by 徐杨 on 2016/12/16.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //默认：导航栏显示、状态栏黑色、导航栏主题色黑色
    [self setNavigationBarHidden:false];
    [self setStatusBarStyle:(UIStatusBarStyleDefault)];
    [self setNavigationBarTintColor:[UIColor blackColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - 导航栏
#pragma mark - 导航栏是否隐藏
- (void)setNavigationBarHidden:(BOOL)hidden{
    [self.navigationController setNavigationBarHidden:hidden];
}

#pragma mark - 导航栏主题颜色
- (void)setNavigationBarTintColor:(UIColor *)color{
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
}

#pragma mark - 导航栏两级标题
- (void)setNavigationTitle:(NSString *)title subTitle:(NSString *)subTitle{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HXFloat(100), 44)];
    UILabel *mainTitle = [UILabel makeLabel:^(UILabel *make) {
        make.labelTextAlignment(NSTextAlignmentCenter).labelFont([UIFont systemFontOfSize:15]).labelText(title).labelAddToView(titleView);
    }];
    [mainTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleView).with.offset(5);
        make.centerX.equalTo(titleView);
    }];
    UILabel *secondaryTitle = [UILabel makeLabel:^(UILabel *make) {
        make.labelTextAlignment(NSTextAlignmentCenter).labelFont([UIFont systemFontOfSize:11]).labelText(subTitle).labelAddToView(titleView);
    }];
    [secondaryTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mainTitle.mas_bottom).with.offset(2);
        make.centerX.equalTo(titleView);
    }];
    self.navigationItem.titleView = titleView;
}

#pragma mark - 导航栏返回按钮文字(在push后的下个界面显示)
- (void)setNavigationBackBarButtonTitleBeforePush:(NSString *)title{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = title;
    self.navigationItem.backBarButtonItem = backItem;
}

#pragma mark - 导航栏返回按钮文字(当前页面显示)
- (void)setNavigationBackBarButtonTitle:(NSString *)title{
    UIBarButtonItem *item = (UIBarButtonItem *)self.navigationController.navigationBar.topItem;
    item.title = title;
}

#pragma mark - 状态栏
- (void)setStatusBarStyle:(UIStatusBarStyle)style{
    [[UIApplication sharedApplication] setStatusBarStyle:style animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
