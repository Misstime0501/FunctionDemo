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

@interface LeftMenuViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *addressSearchBar;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *titleArray;

@property (nonatomic, strong) NSArray     *cellImage;




@end

@implementation LeftMenuViewController

- (UISearchBar *)addressSearchBar
{
    if (_addressSearchBar == nil)
    {
        _addressSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH * 0.75, SCREEN_HEIGHT * 0.1)];
        _addressSearchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _addressSearchBar.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
        _addressSearchBar.keyboardType = UIKeyboardTypeDefault;
        _addressSearchBar.backgroundColor = [UIColor redColor];
        _addressSearchBar.showsScopeBar = YES;
        _addressSearchBar.showsCancelButton = YES;
        _addressSearchBar.delegate = self;
        _addressSearchBar.placeholder = @"查询地点";
        _addressSearchBar.translucent = YES;
        _addressSearchBar.barStyle = UIBarStyleDefault;
    }
    return _addressSearchBar;
}



- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView                  = [[UITableView alloc] init];
        _tableView.delegate         = self;
        _tableView.dataSource       = self;
        _tableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
        
        NSIndexPath *indexpath      = [NSIndexPath indexPathForRow:ZERO inSection:ZERO];
        
        _tableView.tableHeaderView  = self.addressSearchBar;
        
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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleArray = LEFT_MENU_TITLE_ARRAY;
    self.cellImage  = LEFT_MENU_CELL_IMAGE_ARRAY;
    
    [self.view addSubview:self.addressSearchBar];
    [self.view addSubview:self.tableView];
    
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
    
//    [self.addressSearchBar mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(vc.view.mas_top);
//        make.left.equalTo(vc.view.mas_left);
//        make.right.equalTo(vc.view.mas_right);
//        make.height.mas_equalTo(SCREEN_HEIGHT * 0.1);
//    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(vc.view.mas_top);
        make.left.equalTo(vc.view.mas_left);
        make.right.equalTo(vc.view.mas_right);
        make.bottom.equalTo(vc.view.mas_bottom);
    }];
}



#pragma mark - 搜索栏的代理方法
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    

}

#pragma mark - searchBardelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    // 成为第一事件响应者 , 返回 NO 的话取消第一响应事件
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText
{
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"开始在文本框里进行编辑");
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"触摸输入框之外");
    return YES;
}// return NO to not resign first responder

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"当文本编辑结束");
}// called when text ends editing

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if (searchBar.text.length > 0)
    {
        
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    if (searchBar.text.length > 0)
    {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
