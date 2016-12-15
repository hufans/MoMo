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

@end

@interface EnterTableViewCell : UITableViewCell

@property (nonatomic, weak)id<EnterDelegate> delegate;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(enterCellType)type mode:(showMode)mode;

@end
