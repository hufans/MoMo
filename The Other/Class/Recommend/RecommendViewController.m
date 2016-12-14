//
//  RecommendViewController.m
//  The Other
//
//  Created by 徐杨 on 2016/12/12.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "RecommendViewController.h"
#import "LoginViewController.h"

@interface RecommendViewController ()

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐";
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   
    LoginViewController *Login =  [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentModalViewController:Login animated:YES];
//    [self presentViewController:Login:completion:YES];
    
    
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
