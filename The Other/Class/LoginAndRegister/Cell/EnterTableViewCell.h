//
//  EnterTableViewCell.h
//  The Other
//
//  Created by 徐杨 on 2016/12/15.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol EnterDelegate <NSObject>

///发送验证码
- (void)sendVerificationCode:(completeBlock)block;
///注册下一步
- (void)registerNextStep;


@end

@interface EnterTableViewCell : UITableViewCell

@property (nonatomic, weak)id<EnterDelegate> delegate;

@property (nonatomic)UITextField *inputField;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(EnterCellType)type mode:(ShowMode)mode;

@end
