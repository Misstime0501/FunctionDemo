//
//  LeftMenuViewController.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/28.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "AllViewControllersTool.h"
#import "LeftMenuViewController.h"
#import "MacroOfDefine.h"
#import "Masonry.h"
#import "SideMenuTableViewCell.h"

#define VIEW_WIDTH           self.view.frame.size.width
#define VIEW_HEIGHT          self.view.frame.size.height

@interface LeftMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *titleArray;

@property (nonatomic, strong) NSArray     *cellImage;

@end

@implementation LeftMenuViewController

- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView                  = [[UITableView alloc] init];
        _tableView.delegate         = self;
        _tableView.dataSource       = self;
        _tableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
        
        NSIndexPath *indexpath      = [NSIndexPath indexPathForRow:ZERO inSection:ZERO];
        
        [_tableView selectRowAtIndexPath:indexpath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    return _tableView;
}

- (NSArray *)titleArray
{
    if (!_titleArray)
    {
        _titleArray = [[NSArray alloc] init];
    }
    return _titleArray;
}

- (NSArray *)cellImage
{
    if (!_cellImage)
    {
        _cellImage = [[NSArray alloc] init];
    }
    return _cellImage;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.backgroundColor = [UIColor lightGrayColor];
    
    _titleArray = LEFT_MENU_TITLE_ARRAY;
    _cellImage  = LEFT_MENU_CELL_IMAGE_ARRAY;
    
    [self.view addSubview:_tableView];
    
    [self setupConstrain];
    
}


#pragma mark - tableView 添加数据
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideMenuTableViewCell *cell = [SideMenuTableViewCell createCellWithTableView:tableView];
    cell.title                  = self.titleArray[indexPath.row];
    cell.iconImage              = self.cellImage[indexPath.row];
    
    if (indexPath.row == 0)
    {
        cell.selectBackgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //点击对应的cell切换对应的视图控制器
    [AllViewControllersTool createViewControllerWithIndex:indexPath.row];
    
    //遍历所有cell，将选中的设为白色，没选中的设为灰色
    for (NSUInteger index = 0; index < self.titleArray.count; index ++)
    {
        SideMenuTableViewCell *cell     = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        if (index == indexPath.row)
        { //选中cell
            cell.selectBackgroundColor  = [UIColor whiteColor];
        }
        else
        { //非选中的cell
            cell.selectBackgroundColor  = [UIColor lightGrayColor];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LEFT_MENU_CELL_HEIGHT;
}




- (void)setupConstrain
{
    __weak typeof(self)vc = self;
    
//    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(vc.view.mas_top);
//        make.left.equalTo(vc.view.mas_left);
//        make.right.equalTo(vc.view.mas_right);
//        make.height.mas_equalTo(VIEW_HEIGHT * 0.3);
//    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(vc.view.mas_top);
        make.left.equalTo(vc.view.mas_left);
        make.right.equalTo(vc.view.mas_right);
        make.bottom.equalTo(vc.view.mas_bottom);
    }];
    
//    [self.playMusicView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.equalTo(vc.view.mas_left);
//        make.right.equalTo(vc.view.mas_right);
//        make.bottom.equalTo(vc.view.mas_bottom);
//        make.height.mas_equalTo(VIEWHEIGHT * 0.1);
//    }];
}

@end
