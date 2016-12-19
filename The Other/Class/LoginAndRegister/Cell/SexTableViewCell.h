//
//  SexTableViewCell.h
//  The Other
//
//  Created by 徐杨 on 2016/12/19.
//  Copyright © 2016年 胡凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SexTableViewCell : UITableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title selected:(BOOL)selected;

- (void)setCellSelected:(BOOL)selected;

@end
