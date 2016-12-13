//
//  HomeViewController.m
//  The Other
//
//  Created by 徐杨 on 2016/12/8.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "HomeViewController.h"
#import "MJRefresh.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *testTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.testTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    self.testTableView.delegate = self;
    self.testTableView.dataSource = self;
    [self.view addSubview:self.testTableView];
    
    //MJRefreshNormalHeader.m文件中设置下拉刷新动画
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新了");
    }];
    
    self.testTableView.mj_header = refreshHeader;
    
    refreshHeader.lastUpdatedTimeLabel.hidden = true;
    refreshHeader.stateLabel.hidden = true;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
