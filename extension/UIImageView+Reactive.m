//
//  UIImageView+Reactive.m
//  Category
//
//  Created by 徐杨 on 2016/12/6.
//  Copyright © 2016年 H&X. All rights reserved.
//

#import "UIImageView+Reactive.h"
#import <objc/runtime.h>

static const void *imageViewTapKey = "uiimageViewTapKey";

UIImageView *imageViewInit(){
    return [[UIImageView alloc] init];
}

@implementation UIImageView (Reactive)

+ (UIImageView *)makeImageView:(void (^)(UIImageView *))make{
    UIImageView *imageView = imageViewInit();
    make(imageView);
    return imageView;
}

+ (UIImageView *)makeImageView:(void (^)(UIImageView *))make image:(UIImage *)image{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    make(imageView);
    imageView.image = image;
    return imageView;
}

#pragma mark - frame
- (ivFrame)ivFrame{
    return ^UIImageView *(CGRect frame){
        self.frame = frame;
        return self;
    };
}

#pragma mark - backgroundColor
- (ivBackgroundColor)ivBackgroundColor{
    return ^UIImageView *(UIColor *color){
        [self setBackgroundColor:color];
        return self;
    };
}

#pragma mark - addToView
- (ivAddToView)ivAddToView{
    return ^UIImageView *(UIView *parentView){
        [parentView addSubview:self];
        return self;
    };
}

#pragma mark - tag
- (ivTag)ivTag{
    return ^UIImageView *(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

#pragma mark - center
- (ivCenter)ivCenter{
    return ^UIImageView *(CGPoint center){
        self.center = center;
        return self;
    };
}

#pragma mark - alpha
- (ivAlpha)ivAlpha{
    return ^UIImageView *(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}

#pragma mark - userInteractionEnabled
- (ivUserInteractionEnabled)ivUserInteractionEnabled{
    return ^UIImageView *(BOOL flag){
        self.userInteractionEnabled = flag;
        return self;
    };
}

#pragma mark - image
- (ivimage)ivimage{
    return ^UIImageView *(UIImage *image){
        self.image = image;
        return self;
    };
}

#pragma mark - tap
- (void)setImageViewTap:(imageViewTapClosure)imageViewTap{
    objc_setAssociatedObject(self, imageViewTapKey, imageViewTap, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (imageViewTap) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapFunction)];
        [self addGestureRecognizer:tapGesture];
    }
}

- (imageViewTapClosure)imageViewTap{
    return objc_getAssociatedObject(self, imageViewTapKey);
}

- (void)imageViewTapFunction{
    !self.imageViewTap ? : self.imageViewTap(self);
}

@end
