//
//  IWPFWeatherViewController.h
//  iwpf
//
//  Created by Chen Li on 16/9/19.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroOfDefine.h"

typedef NS_ENUM(NSUInteger, LHTDScrollViewCellType){
    LHTDScrollViewCellTypeCurrentWeather    = 1,
    LHTDScrollViewCellTypeTomorrowWeather,
    LHTDScrollViewCellTypeForecastWeather,
    LHTDScrollViewCellTypeWeatherMap,
};

static const CGFloat kNumberOfSections                  = 4.0;
static const CGFloat kRowsInSection                     = 1.0;

// TODO: 此处要判断机型,从而改变尺寸
static const CGFloat kCellTypeCurrentWeatherHeight      = 568.0;
static const CGFloat kCellTypeTomorrowWeatherHeight     = 150.0;
static const CGFloat kCellTypeForecastWeatherHeight     = 284.0;
static const CGFloat kCellTypeWeatherMapHeight          = 284.0;

static NSString *const kTableViewCellTypeCurrentWeatherIdentifier   = @"LHTDCellTypeCurrentWeatherIdentifier";
static NSString *const kTableViewCellTypeTomorrowWeatherIdentifier  = @"LHTDCellTypeTomorrowWeatherIdentifier";
static NSString *const kTableViewCellTypeForecastWeatherIdentifier  = @"LHTDCellTypeForecastWeatherIdentifier";
static NSString *const kTableViewCellTypeWeatherMapIdentifier       = @"LHTDCellTypeWeatherMapIdentifier";


@interface IWPFWeatherViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)   UITableView         *tableView;

@property (strong, nonatomic)   NSString            *currentTableViewTitle;

//  TODO: 所有显示数据信息设置为可变数组,此处需要推敲,在可变字典和可变数组之中选择
@property (strong, nonatomic)   NSMutableArray      *currentWeatherInformationArray;
@property (strong, nonatomic)   NSMutableArray      *tomorrowWeatherInformationArray;
@property (strong, nonatomic)   NSMutableArray      *forecastWeatherInformationArray;
@property (strong, nonatomic)   NSMutableArray      *weatherMapInformationArray;


- (instancetype)init;

@end
