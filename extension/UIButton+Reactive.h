//
//  UIButton+Reactive.h
//  Category
//
//  Created by 徐杨 on 2016/12/5.
//  Copyright © 2016年 H&X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseHeader.h"
//C声明
UIButton *buttonInit();
extern CGFloat hxFloat(CGFloat);

@interface UIButton (Reactive)

+ (UIButton *)makeButton:(void (^)(UIButton *))make;

- (btnFrame)btnFrame;
- (btnBackgroundColor)btnBackgroundColor;
- (btnAddToView)btnAddToView;
- (btnTag)btnTag;
- (btnCenter)btnCenter;
- (btnAlpha)btnAlpha;

- (btnTitleLableFont)btnTitleLableFont;
- (btnTitle)btnTitle;
- (btnTitleForState)btnTitleForState;
- (btnTitleColor)btnTitleColor;
- (btnTitleColorForState)btnTitleColorForState;
- (btnImage)btnImage;
- (btnImageForState)btnImageForState;
- (btnAddTarget)btnAddTarget;
- (btnTitleEdgeInsets)btnTitleEdgeInsets;
- (btnImageEdgeInsets)btnImageEdgeInsets;
- (btnContentEdgeInsets)btnContentEdgeInsets;


@property (nonatomic, copy)btnClickClosure click;

@end
