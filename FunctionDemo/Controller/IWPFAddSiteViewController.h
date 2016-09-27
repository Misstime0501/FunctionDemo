//
//  IWPFAddSiteViewControllerTableViewController.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/26.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroOfDefine.h"
#import "IWPFTools.h"

@interface IWPFAddSiteViewController : UITableViewController <UISearchBarDelegate>
{
    NSMutableArray      *_forecastSite;
    UISearchBar         *_searchBar;
    UISearchController  *_searchController;
}

@property (nonatomic, strong) UISearchBar        *searchBar;
@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) NSMutableArray     *forecastSite;

@end
