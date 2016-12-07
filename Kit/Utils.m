//
//  Utils.m
//  The Other
//
//  Created by 徐杨 on 2016/12/7.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (BOOL)validateMobile:(NSString *)mobile{
    NSString *phoneRegex = @"^1((3|5|7|8)\\d)\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

+ (BOOL)validateEmailAdress:(NSString *)email{
    NSString *emailPattern = @"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailPattern];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)validateNumber:(NSString *)number{
    NSString *numberPattern = @"^[0-9]+(.[0-9]{1,2})?$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberPattern];
    return [numberTest evaluateWithObject:number];
}

@end
