//
//  IWPFWeatherViewController.m
//  iwpf
//
//  Created by Chen Li on 16/9/19.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFWeatherViewController.h"

@implementation IWPFWeatherViewController

@synthesize tableView                   = _tableView;
@synthesize currentTableViewTitle       = _currentTableViewTitle;



- (instancetype)init
{
    self = [super init];
    if  (self)
    {
        IWPFLog(@"WeatherView Init");
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewConfigure];
    [self navigationConfigure];
    [self tableViewConfigure];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    
}

#pragma mark - PPRevealSideViewController

- (void)addSiteViewController:(id)sender
{
    //    [self.revealSideViewController pushOldViewControllerOnDirection:PPRevealSideDirectionRight
    //                                                         withOffset:ScreenWidth / 4
    //                                                           animated:YES];
}

- (void)showMoreInformationViewController:(id)sender
{
    
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
        //        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (void)navigationConfigure
{
    self.navigationItem.title = @"天气";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"北土城西路" style:UIBarButtonItemStylePlain target:self action:@selector(addSiteViewController:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(showMoreInformationViewController:)];
    
    //    self.navigationController.navigationBar.translucent = YES;
    //    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    [[UINavigationBar appearance] setTintColor:[UIColor clearColor]];
    
}



@end
