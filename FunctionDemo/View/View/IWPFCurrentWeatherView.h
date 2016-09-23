//
//  IWPFCurrentWeatherView.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/21.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroOfDefine.h"

@interface IWPFCurrentWeatherView : UIView
{
    // 温度 (可点击)
    UIButton *_currentWeather;
    // 天气状态
    UILabel  *_currentWeatherState;
    
    // 湿度
    UILabel  *_currentHumidityTitle;
    UILabel  *_currentHumidityInformation;
    
    // 风力
    UILabel  *_currentWindTitle;
    UILabel  *_currentWindInformation;
    
    // 风向
    UILabel  *_currentWindDirectionTitle;
    UILabel  *_currentWindDirectionInformation;
    
    // 气压
    UILabel  *_currentAtmosphericPressureTitle;
    UILabel  *_currentAtmosphericPressureInformation;

    // 污染物浓度 (可点击)
    UIButton *_currentPollutionTitle;
    UILabel  *_currentPollutionInformation;
    
    // 反馈 (可点击)
    UILabel  *_feedbackButton;
}

@property (nonatomic, strong) NSMutableDictionary *weatherInformationDictionary;


@end
