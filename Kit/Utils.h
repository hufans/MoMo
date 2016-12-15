//
//  Utils.h
//  The Other
//
//  Created by 徐杨 on 2016/12/7.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

///验证手机号码
+ (BOOL)validateMobile:(NSString *)mobile;
///验证邮箱
+ (BOOL)validateEmailAdress:(NSString *)email;
///保留两位小数
+ (BOOL)validateNumber:(NSString *)number;
///计算文本大小
+ (CGSize)calculateStringSize:(NSString *)string font:(UIFont *)font maxSize:(CGSize)size;

@end
