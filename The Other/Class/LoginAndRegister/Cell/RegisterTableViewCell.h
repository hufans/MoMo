//
//  RegisterTableViewCell.h
//  The Other
//
//  Created by 徐杨 on 2016/12/16.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterTableViewCellDelegate <NSObject>

///注册下一步事件
- (void)registerNextStep2;

@end

@interface RegisterTableViewCell : UITableViewCell

@property (nonatomic) UITextField *inputField;
@property (nonatomic) id<RegisterTableViewCellDelegate> delegate;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(RegisterCellType)type;

///选择完成时，修改cell的文本提示
- (void)setHintLabelText:(NSString *)text;

@end
