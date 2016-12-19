//
//  EnterButton.h
//  The Other
//
//  Created by 徐杨 on 2016/12/15.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame type:(NSString *)type isSelected:(BOOL)isSelected;

///重绘方法
- (void)reDraw:(BOOL)isSelected;

@end
