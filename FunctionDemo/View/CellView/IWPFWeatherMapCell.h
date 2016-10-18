//
//  IWPFWeatherMapCell.h
//  FunctionDemo
//
//  Created by Chen Li on 16/10/11.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>

@interface IWPFWeatherMapCell : UITableViewCell<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) MAHeatMapTileOverlay *heatMapTileOverlay;

@property (nonatomic, strong) UIView *controls;


- (instancetype)initWithFrame:(CGRect)frame;

@end
