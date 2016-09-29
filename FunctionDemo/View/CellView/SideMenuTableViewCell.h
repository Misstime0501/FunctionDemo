//
//  SideMenuTableViewCell.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/28.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuTableViewCell : UITableViewCell

// cell 的标题
@property (nonatomic, copy)     NSString *title;
// cell 的图标
@property (nonatomic, copy)     NSString *iconImage;
// cell 选中后的背景色
@property (nonatomic, strong)   UIColor  *selectBackgroundColor;
// 标题
@property (nonatomic, strong)   UILabel *titleLabel;
// 图标
@property (nonatomic, strong)   UIImageView *iconImageView;


+ (instancetype)createCellWithTableView:(UITableView *)tableView;

@end
