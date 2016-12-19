//
//  BaseViewController.h
//  The Other
//
//  Created by 徐杨 on 2016/12/16.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

///导航栏是否隐藏
- (void)setNavigationBarHidden:(BOOL)hidden;
///导航栏主题颜色
- (void)setNavigationBarTintColor:(UIColor *)color;
///导航栏两级标题
- (void)setNavigationTitle:(NSString *)title subTitle:(NSString *)subTitle;
///导航栏返回按钮文字(在push之后的下个页面显示)
- (void)setNavigationBackBarButtonTitleBeforePush:(NSString *)title;
///导航栏返回按钮文字(当前页面显示)
- (void)setNavigationBackBarButtonTitle:(NSString *)title;

///状态栏样式
- (void)setStatusBarStyle:(UIStatusBarStyle)style;

@end
