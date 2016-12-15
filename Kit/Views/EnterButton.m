//
//  EnterButton.m
//  The Other
//
//  Created by 徐杨 on 2016/12/15.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import "EnterButton.h"

@interface EnterButton()

@property (nonatomic) NSString *type;
@property (nonatomic) BOOL isSelected;

@end

@implementation EnterButton

- (instancetype)initWithFrame:(CGRect)frame type:(NSString *)type isSelected:(BOOL)isSelected{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        self.isSelected = isSelected;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {//0.78
    //创建路径并获取句柄
    CGMutablePathRef path = CGPathCreateMutable();
    //获取上下文
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    if ([self.type isEqual: @"left"]) {
        CGRect rectangle = CGRectMake(0, 0, rect.size.width*(108/138.0), rect.size.height);  //指定矩形
        CGPathAddRect(path,NULL, rectangle);    //将矩形添加到路径中
        CGContextAddPath(currentContext, path);     //将路径添加到上下文
        //三角形
        CGContextMoveToPoint(currentContext, rect.size.width*(108/138.0), 0);
        CGContextAddLineToPoint(currentContext, rect.size.width*(108/138.0), rect.size.height);
        CGContextAddLineToPoint(currentContext, rect.size.width, rect.size.height);
        CGContextClosePath(currentContext);
        
    }else if ([self.type isEqual: @"right"]){
        //指定矩形
        CGRect rectangle = CGRectMake(rect.size.width*(30/138.0), 0, rect.size.width - rect.size.width*(30/138.0), rect.size.height);
        CGPathAddRect(path, NULL, rectangle);
        CGContextAddPath(currentContext, path);
        //三角形
        CGContextMoveToPoint(currentContext, rect.size.width*(30/138.0), 0);
        CGContextAddLineToPoint(currentContext, rect.size.width*(30/138.0), rect.size.height);
        CGContextAddLineToPoint(currentContext, 0, rect.size.height);
        CGContextClosePath(currentContext);
    }
    if (self.isSelected) {
        [[UIColor colorWithRed:59/255.0 green:207/255.0 blue:219/255.0 alpha:1.0f]setFill];//设置矩形填充色
        [[UIColor colorWithRed:59/255.0 green:207/255.0 blue:219/255.0 alpha:1.0f] setStroke];//矩形边框颜色
        [self setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }else{
        [[UIColor whiteColor]setFill];//设置矩形填充色
        [[UIColor whiteColor] setStroke];//矩形边框颜色
        
        [self setTitleColor:themeColor forState:(UIControlStateNormal)];
    }
    CGContextSetLineWidth(currentContext,1.0f);//边框宽度

    CGContextDrawPath(currentContext, kCGPathFillStroke);//绘制
    CGPathRelease(path);
}

- (void)reDraw:(BOOL)isSelected{
    self.isSelected = isSelected;
    [self setNeedsDisplay];
}


@end
