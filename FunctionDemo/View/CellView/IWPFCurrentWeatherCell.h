//
//  IWPFCurrentWeatherCell.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/21.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IWPFCurrentWeatherCell : UITableViewCell



@property (nonatomic, strong) NSMutableDictionary *weatherInformation;


@property (nonatomic, strong) UIView   *currentWeatherView;

// 温度 (可点击)
@property (nonatomic, strong) UILabel  *currentWeather;
// 天气状态
@property (nonatomic, strong) UILabel  *currentWeatherState;

// 湿度
@property (nonatomic, strong) UILabel  *currentHumidityTitle;
@property (nonatomic, strong) UILabel  *currentHumidityInformation;

// 风力
@property (nonatomic, strong) UILabel  *currentWindTitle;
@property (nonatomic, strong) UILabel  *currentWindInformation;

// 风向
@property (nonatomic, strong) UILabel  *currentWindDirectionTitle;
@property (nonatomic, strong) UILabel  *currentWindDirectionInformation;

// 气压
@property (nonatomic, strong) UILabel  *currentAtmosphericPressureTitle;
@property (nonatomic, strong) UILabel  *currentAtmosphericPressureInformation;

// 污染物浓度 (可点击)
@property (nonatomic, strong) UIButton *currentPollutionTitle;
@property (nonatomic, strong) UILabel  *currentPollutionInformation;

// 反馈 (可点击)
@property (nonatomic, strong) UILabel  *feedbackButton;





- (instancetype)initWithInformation:(NSDictionary *)weatherInformation frame:(CGRect)frame;

@end
