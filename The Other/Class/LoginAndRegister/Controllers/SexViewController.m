//
//  SexViewController.m
//  The Other
//
//  Created by 徐杨 on 2016/12/19.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "SexViewController.h"
#import "SexTableViewCell.h"

@interface SexViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) UITableView *sexTableView;

@end

@implementation SexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //通用设置
    [self generalSettings];
    //
    [self tableViewSettings];
}

#pragma mark - 通用设置
- (void)generalSettings{
    self.title = @"性别";
    [self setNavigationBackBarButtonTitle:@"返回"];
}

#pragma mark - UITableView设置
- (void)tableViewSettings{
    self.sexTableView = [UITableView makeTableView:^(UITableView *make) {
        make.tvSeparatorStyle(UITableViewCellSeparatorStyleNone).tvDataSource(self).tvDelegate(self).tvBackgroundColor(RGB(245, 244, 244, 1.0)).tvAddToView(self.view);
    }];
    [self.sexTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(HXFloat(30));
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

#pragma mark - UITableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"sexCell";
    NSString *title = ((int)indexPath.row == 0) ? @"男" : @"女";
    SexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        BOOL selected = false;
        if (indexPath.row == self.currentSelected - 1) {
            selected = true;
        }
        cell = [[SexTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier title:title selected:selected];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SexTableViewCell *maleCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    SexTableViewCell *femaleCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    [maleCell setCellSelected:(indexPath.row == 0)];
    [femaleCell setCellSelected:indexPath.row == 1];
    if (self.chooseComplete != nil) {
        self.chooseComplete((indexPath.row == 0)?@"男":@"女");
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
