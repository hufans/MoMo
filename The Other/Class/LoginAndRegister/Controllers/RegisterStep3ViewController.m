//
//  RegisterStep3ViewController.m
//  The Other
//
//  Created by 徐杨 on 2016/12/19.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "RegisterStep3ViewController.h"

@interface RegisterStep3ViewController ()

@end

@implementation RegisterStep3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //通用设置
    [self generalSettings];
    
}

#pragma mark - 通用设置
- (void)generalSettings{
    //顶部标题
    [self setNavigationTitle:@"注册" subTitle:@"我的照片"];
    //返回字样
    [self setNavigationBackBarButtonTitle:@"上一步"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
