//
//  IWPFAddSiteViewControllerTableViewController.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/26.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFAddSiteViewController.h"

@interface IWPFAddSiteViewController ()

@end

@implementation IWPFAddSiteViewController


@synthesize forecastSite     = _forecastSite;

@synthesize searchBar        = _searchBar;
@synthesize searchController = _searchController;






- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _forecastSite = [IWPFTools readUserDefaults:];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - SearchView

- (void)createSearchBar
{
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH - HUNDRED_OFFSET, ADDSITE_SEARCHBAR_HEIGHT)];
    _searchBar.backgroundColor  = [UIColor clearColor];
    _searchBar.keyboardType     = UIKeyboardTypeDefault;
    _searchBar.placeholder      = ADDSITE_SEARCHBAR_PLACEHOLDER;
    _searchBar.barStyle         = UIBarStyleDefault;
    
    // 自动校正类型
    _searchBar.autocorrectionType = UITextAutocorrectionTypeDefault;
    // 自动大写类型
    _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _searchBar.delegate         = self;
}









- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    self.tableView.allowsSelection = NO;
    self.tableView.scrollEnabled = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.tableView.allowsSelection = YES;
    self.tableView.scrollEnabled = YES;
    searchBar.text = EMPTY_STR;
    [self updateSearchString:searchBar.text];
    [searchBar resignFirstResponder];   //隐藏输入键盘
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.tableView.allowsSelection = YES;
    self.tableView.scrollEnabled = YES;
    
    [self updateSearchString:searchBar.text];
    [searchBar resignFirstResponder];   //隐藏输入键盘
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    IWPFLog(@"   touchesBegan    ");
    [self.searchController.searchBar resignFirstResponder];
}

- (void)updateSearchString:(NSString *)aSearchString
{
    [self.tableView reloadData];
}


@end
