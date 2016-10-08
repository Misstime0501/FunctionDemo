//
//  IWPFWeatherViewController.m
//  iwpf
//
//  Created by Chen Li on 16/9/19.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFWeatherViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIBarButtonItem+Helper.h"
#import "UIViewController+MMDrawerController.h"



@implementation IWPFWeatherViewController

@synthesize tableView                   = _tableView;
@synthesize currentTableViewTitle       = _currentTableViewTitle;



- (void)viewDidLoad
{
    [super viewDidLoad];
    // view controller 设置
    [self viewConfigure];
//    // table view 设置
    [self tableViewConfigure];
    // 导航栏设置
    [self navigationConfigure];
    
}




















- (instancetype)init
{
    self = [super init];
    if  (self)
    {
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark - PPRevealSideViewController

- (void)addSiteViewController:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)showMoreInformationViewController:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}







#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kNumberOfSections;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kRowsInSection;
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    static NSString *CellIdentifier = @"Cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //
    //    return cell;
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Main %ld", (long)indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.1];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    if (editingStyle == UITableViewCellEditingStyleDelete) {
    //        [self.objects removeObjectAtIndex:indexPath.row];
    //        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    //        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    //    }
}














#pragma mark - Private Methods

- (void)viewConfigure
{
    self.view.backgroundColor = [UIColor brownColor];
}

- (void)tableViewConfigure
{
    
    [self.view addSubview:self.itemTableView];
}

- (UITableView *)itemTableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _tableView.bounces = YES;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (void)navigationConfigure
{
    
    self.navigationItem.title                   = @"天气";
    
    NSString *localtion                         = [[NSString alloc] initWithFormat:@"北土城西路"];
    
    MMDrawerBarButtonItem *leftBarButtonItem    = [MMDrawerBarButtonItem itemWithTitle:localtion backgroundImage:nil normalColor:[UIColor whiteColor] highlightedColor:[UIColor redColor] target:self action:@selector(addSiteViewController:)];
    MMDrawerBarButtonItem *rightBarButtonItem   = [MMDrawerBarButtonItem itemWithTitle:@"更多" backgroundImage:nil normalColor:[UIColor whiteColor] highlightedColor:[UIColor redColor] target:self action:@selector(showMoreInformationViewController:)];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

    self.navigationController.navigationBar.translucent = YES;
    
}



@end
