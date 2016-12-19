//
//  SexViewController.h
//  The Other
//
//  Created by 徐杨 on 2016/12/19.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SexViewController : BaseViewController

///1、表示男  2、表示女
@property (nonatomic, assign) int currentSelected;
///选择完成回调
@property (nonatomic) chooseComplete chooseComplete;

@end
