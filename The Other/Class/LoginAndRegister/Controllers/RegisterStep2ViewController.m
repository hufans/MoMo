//
//  RegisterStep2ViewController.m
//  The Other
//
//  Created by 徐杨 on 2016/12/16.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "RegisterStep2ViewController.h"
#import "RegisterTableViewCell.h"
#import "SexViewController.h"
#import "BirthdayViewController.h"
#import "RegisterStep3ViewController.h"

@interface RegisterStep2ViewController ()<UITableViewDelegate,UITableViewDataSource,RegisterTableViewCellDelegate>

@property (nonatomic) UITableView *mainTableView;
@property (nonatomic) NSArray *identifierArray;
///日期选择控制器
@property (nonatomic) BirthdayViewController *birthdayVC;

@end

@implementation RegisterStep2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //通用设置
    [self generalSettings];
    //主体部分
    [self addTableviewSettings];
}

#pragma mark - 通用设置
- (void)generalSettings{
    //设置顶部标题
    [self setNavigationTitle:@"注册" subTitle:@"完善信息"];
    self.navigationItem.hidesBackButton = true;
    self.identifierArray = @[@"yourName",@"yourSex",@"yourBirthday",@"yourLikeSex",@"yourTag"];
}

#pragma mark - UITableView设置
- (void)addTableviewSettings{
    self.mainTableView = [UITableView makeTableView:^(UITableView *make) {
        make.tvBounces(false).tvBackgroundColor([UIColor whiteColor]).tvDataSource(self).tvDelegate(self).tvSeparatorStyle(UITableViewCellSeparatorStyleNone).tvAddToView(self.view);
    }];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(HXFloat(30));
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

#pragma mark - UITableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = self.identifierArray[indexPath.row];
    RegisterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
            cell = [[RegisterTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier type:indexPath.row];
    }
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        //最后一个cell的高度等于屏幕剩余高度
        return SCREEN_HEIGHT - 44*4 - 64 - HXFloat(30);
    }else{
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1 || indexPath.row == 3) {//选择性别
        SexViewController *sexVC = [[SexViewController alloc] init];
//        sexVC.currentSelected = 1;
        sexVC.chooseComplete = ^(NSString *sex){
            RegisterTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            NSString *defaultHintText = (indexPath.row == 1) ? @"您的性别" : @"您喜欢的对象性别";
            [cell setHintLabelText:[NSString stringWithFormat:@"%@：%@",defaultHintText,sex]];
        };
        [self.navigationController pushViewController:sexVC animated:true];
    }else if (indexPath.row == 2){
        if (self.birthdayVC == nil) {
            self.birthdayVC = [[BirthdayViewController alloc] init];
            self.birthdayVC.view.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200);
            //获取当前cell
            RegisterTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            HXWeakSelf(self)
            //时间选择完成之后的回调
            self.birthdayVC.chooseComplete = ^(NSDate *date){
                NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
                [fmt setDateFormat:@"yyyy年MM月dd日"];
                [cell setHintLabelText:[NSString stringWithFormat:@"您的生日：%@",[fmt stringFromDate:date]]];
                [UIView animateWithDuration:0.5 animations:^{
                    HXStrongSelf(weakSelf)
                    strongSelf.birthdayVC.view.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200);
                }];
            };
            [self.view addSubview:self.birthdayVC.view];
        }
        [UIView animateWithDuration:0.5 animations:^{
            self.birthdayVC.view.frame = CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 200);
        }];
    }
}

#pragma mark - cell代理方法
- (void)registerNextStep2{
    //先做逻辑处理
    //...
    RegisterStep3ViewController *photoVC = [[RegisterStep3ViewController alloc] init];
    [self.navigationController pushViewController:photoVC animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
