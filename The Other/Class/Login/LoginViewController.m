//
//  LoginViewController.m
//  The Other
//
//  Created by 胡凡 on 12/13/16.
//  Copyright © 2016 胡凡. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTableViewCell.h"

@interface LoginViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *Tableview;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(20,60,254,1);
    
    
}

-(void)loadTableView{

    self.Tableview.delegate = self;
    self.Tableview.dataSource = self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellString = @"cell1";
    LoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    if (cell == nil) {
        NSArray *nibArr = [[NSBundle mainBundle]loadNibNamed:cellString owner:self options:nil];
        cell = (LoginTableViewCell *)[nibArr firstObject];
        [cell setValue:cellString forKey:@"reuseIdentifier"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
