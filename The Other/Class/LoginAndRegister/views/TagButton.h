//
//  TagButton.h
//  The Other
//
//  Created by 徐杨 on 2016/12/19.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TagButton;
@protocol TagButtonDelegate <NSObject>

///点击按钮时的事件
- (void)selectTagAction:(int)index andTagButton:(TagButton *)btn;

@end

@interface TagButton : UIButton<UICollectionViewDelegateFlowLayout>

///自动布局之后的frame
@property (nonatomic) CGRect afterLayoutFrame;
///代理
@property (nonatomic, weak)id<TagButtonDelegate> delegate;

///初始化方法
+ (TagButton *)makeTagButton:(void (^)(TagButton *))make;
///布局控件
+ (CGFloat)groupAndAlign:(UIView *)parentView andViews:(NSArray<TagButton *> *)views andRowSpace:(CGFloat)rowSpace andColumnSpace:(CGFloat) columnSpace;

@end
