//
//  SideMenuTableViewCell.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/28.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "MacroOfDefine.h"
#import "SideMenuTableViewCell.h"
#import "UIColor+Extension.h"

@implementation SideMenuTableViewCell

+ (instancetype)createCellWithTableView:(UITableView *)tableView
{
    static NSString *cellName = @"sideMenuCell";
    
    SideMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[SideMenuTableViewCell alloc] init];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectedBackgroundView                 = [[UIView alloc] init];
    self.selectedBackgroundView.backgroundColor = [UIColor darkGrayColor];
    
    //设置cell的背景
    self.titleLabel.textColor = [UIColor lightGrayColor];
    self.backgroundColor = [UIColor colorWithHexString:@"#303030"];
    
    self.iconImageView.contentMode = UIViewContentModeCenter;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.contentView.frame = CGRectMake(ZERO, ZERO, LEFT_MENU_TABLE_CELL_WIDTH, LEFT_MENU_TABLE_CELL_HEIGHT);
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(LEFT_MENU_TABLE_CELL_IMAGE_VIEW_X,
                                                                       LEFT_MENU_TABLE_CELL_IMAGE_VIEW_Y,
                                                                       LEFT_MENU_TABLE_CELL_IMAGE_VIEW_WIDTH,
                                                                       LEFT_MENU_TABLE_CELL_IMAGE_VIEW_HEIGHT)];
        _iconImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_iconImageView];
        
        
        _titleLabel    = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_MENU_TABLE_CELL_LABEL_X,
                                                                   LEFT_MENU_TABLE_CELL_LABEL_Y,
                                                                   LEFT_MENU_TABLE_CELL_LABEL_WIDTH,
                                                                   LEFT_MENU_TABLE_CELL_LABEL_HEIGHT)];
        _titleLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0f];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.backgroundColor = [UIColor colorWithHexString:@"#303030"];
        
        [self addSubview:_titleLabel];
    }
    return self;
}


- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (void)setIconImage:(NSString *)iconImage
{
    _iconImageView.image = [UIImage imageNamed:iconImage];
}

- (void)setSelectBackgroundColor:(UIColor *)selectBackgroundColor
{
    _titleLabel.textColor = selectBackgroundColor;
}












@end
