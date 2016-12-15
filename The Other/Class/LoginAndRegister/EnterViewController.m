//
//  EnterViewController.m
//  The Other
//
//  Created by 徐杨 on 2016/12/14.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "EnterViewController.h"
#import "EnterTableViewCell.h"
#import "EnterButton.h"


@interface EnterViewController ()<UITableViewDelegate,UITableViewDataSource,EnterDelegate>

@property (nonatomic) NSArray *loginIdentifierArray;
@property (nonatomic) NSArray *registerIdentifierArray;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *subTitleLabel;
@property (nonatomic) EnterButton *loginEnterButton;
@property (nonatomic) EnterButton *registerEnterButton;
@property (nonatomic) UITableView *mainTableView;
@property (nonatomic) showMode mode;

@end

@implementation EnterViewController

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true];
    [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyleLightContent) animated:false];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //通用设置
    [self generalSettings];
    //顶部标题视图
    [self addTopView];
    //选项卡
    [self addTab];
    //tableview
    [self addMiddleView];
}

#pragma mark - 界面通用设置
- (void)generalSettings{
    [self.view setBackgroundColor:themeColor];
    //默认显示方式
    self.mode = loginMode;
    self.loginIdentifierArray = @[@"loginPhone",@"loginPwd",@"loginForgotPwd",@"loginButton"];
    self.registerIdentifierArray = @[@"registerPhone",@"registerCode",@"registerPwd",@"registerPwdAgain",@"registerButton"];
}

#pragma mark - 顶部标题视图
- (void)addTopView{
    //主标题
    self.titleLabel = [UILabel makeLabel:^(UILabel *make) {
        make.labelTextColor([UIColor whiteColor]).labelAddToView(self.view).labelFont([UIFont boldSystemFontOfSize:50]).labelText(@"曰曰");
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(@(HXFloat(80)));
    }];
    //副标题
    self.subTitleLabel = [UILabel makeLabel:^(UILabel *make) {
        make.labelAddToView(self.view).labelTextColor([UIColor whiteColor]).labelFont([UIFont systemFontOfSize:15]).labelText(@"总有一个人在等你");
    }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(HXFloat(10));
    }];
}

#pragma mark - 选项卡
- (void)addTab{
    //登录选项卡
    self.loginEnterButton = [[EnterButton alloc] initWithFrame:HXCGRectMake(0, 0, 150, 30) type:@"left" isSelected:true];
    //避免循环引用
    HXWeakSelf(self)
    [self.loginEnterButton addAttribute:^(UIButton *make) {
        HXStrongSelf(weakSelf)
        make.btnBackgroundColor(themeColor).btnTitleLableFont([UIFont boldSystemFontOfSize:15]).btnTitle(@"登录").btnAddToView(strongSelf.view);
    }];
    self.loginEnterButton.click = ^(UIButton *btn){
        HXStrongSelf(weakSelf)
        if (strongSelf.mode != loginMode) {
            strongSelf.mode = loginMode;
            [strongSelf.loginEnterButton reDraw:true];
            [strongSelf.registerEnterButton reDraw:false];
            [strongSelf.mainTableView reloadSections:[[NSIndexSet alloc] initWithIndex:0] withRowAnimation:(UITableViewRowAnimationAutomatic)];
        }
    };
    [self.loginEnterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subTitleLabel.mas_bottom).with.offset(HXFloat(60));
        make.left.mas_equalTo(HXFloat(50));
        make.right.equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(HXFloat(30));
    }];
    
    //注册选项卡
    self.registerEnterButton = [[EnterButton alloc] initWithFrame:HXCGRectMake(0, 0, 150, 30) type:@"right" isSelected:false];
    [self.registerEnterButton addAttribute:^(UIButton *make) {
        HXStrongSelf(weakSelf);
        make.btnBackgroundColor(themeColor).btnTitleLableFont([UIFont boldSystemFontOfSize:15]).btnTitle(@"注册").btnAddToView(strongSelf.view);
    }];
    [self.registerEnterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.loginEnterButton);
        make.right.mas_equalTo(-HXFloat(50));
        make.height.mas_equalTo(HXFloat(30));
    }];
    self.registerEnterButton.click = ^(UIButton *btn){
        HXStrongSelf(weakSelf)
        if (strongSelf.mode != registerMode) {
            strongSelf.mode = registerMode;
            [strongSelf.loginEnterButton reDraw:false];
            [strongSelf.registerEnterButton reDraw:true];
            [strongSelf.mainTableView reloadSections:[[NSIndexSet alloc] initWithIndex:0] withRowAnimation:(UITableViewRowAnimationAutomatic)];
        }
    };
}

#pragma mark - 主体部分
- (void)addMiddleView{
    self.mainTableView = [UITableView makeTableView:^(UITableView *make) {
        make.tvBackgroundColor(themeColor).tvBounces(false).tvSeparatorStyle(UITableViewCellSeparatorStyleNone).tvDataSource(self).tvDelegate(self).tvAddToView(self.view);
    }];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.loginEnterButton.mas_bottom);
        make.size.mas_equalTo(HXCGSizeMake(300, 300));
    }];
}

#pragma mark - UITableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.mode == loginMode) {
        return 4;
    }else{
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //登录的cell
    if (self.mode == loginMode) {
        NSString *identifier = self.loginIdentifierArray[indexPath.row];
        EnterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[EnterTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier type:indexPath.row mode:loginMode];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{//注册的cell
        NSString *identifier = self.registerIdentifierArray[indexPath.row];
        EnterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            int type = 0;
            if (indexPath.row > 0) {
                type = (int)indexPath.row + 3;
            }
            cell = [[EnterTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier type:type mode:registerMode];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.mode == loginMode) {
        if (indexPath.row == 3) {//登录按钮
            return 60;
        }else{
            return 30;
        }
    }else{
        if (indexPath.row == 4){//注册下一步按钮
            return 60;
        }else{
            return 30;
        }
    }
}

#pragma mark - EnterTableViewCell的代理方法
#pragma mark - 发送验证码
- (void)sendVerificationCode:(completeBlock)block{
    block();
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
