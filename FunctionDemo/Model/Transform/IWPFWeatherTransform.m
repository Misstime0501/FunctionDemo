//
//  IWPFWeatherTransform.m
//  FunctionDemo
//
//  Created by Chen Li on 2016/10/12.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFWeatherTransform.h"
#import "IWPFTools.h"

#import "MacroOfDefine.h"


@implementation IWPFWeatherTransform

+ (NSString *)fontTextWithWeatherNumber:(NSNumber *)number
{
    NSString *weatherString = [[NSString alloc] init];
    
    
    return weatherString;
}


+ (NSString *)fontTextWithAddressNumber:(NSNumber *)number
{
    NSString *addressString = [[NSString alloc] init];
    
    
    return addressString;
}


+ (NSString *)integerNumberWithAddressText:(NSString *)addressText
{
    NSPredicate  *predicate    = [NSPredicate predicateWithFormat:@"NAMECN like %@", addressText];
    NSArray      *addressArray = [WEATHER_AREA_ARRAY filteredArrayUsingPredicate:predicate];
    NSDictionary *addressDictionary = [addressArray objectAtIndex:ZERO];
    NSString *areaID = [addressDictionary objectForKey:@"AREAID"];
    return [IWPFTools safeString:areaID];
}









// 1001002       实况
+ (NSString *)observeInformationFromFetchNumber:(NSNumber *)fetchNumber
{
    switch (fetchNumber.intValue)
    {
        case 0:
            // 实况发布时间
            break;
        case 2:
            // 当前温度 (摄氏度)
            break;
        case 3:
            // 当前风力 (单位是级 , 不用转码)
            break;
        case 4:
            // 当前风向编号
            break;
        case 5:
            // 当前湿度 (单位 %)
            break;
        case 6:
            // 当前降水量 (单位是毫米)
            break;
        case 7:
            // 当前气压 (单位百帕)
            break;
        default:
            break;
    }
    return @"";
}

// 1001003       预警
+ (NSString *)alarmInformationFromFetchNumber:(NSNumber *)fetchNumber
{
    switch (fetchNumber.integerValue)
    {
        case 1:
            // 预警发布单位的省级名称
            break;
        case 2:
            // 预警发布单位的市级名称
            break;
        case 3:
            // 预警发布单位的县级名称
            break;
        case 4:
            // 预警类别编号
            break;
        case 5:
            // 预警类别名称
            break;
        case 6:
            // 预警级别编号
            break;
        case 7:
            // 预警级别名称
            break;
        case 8:
            // 预警发布时间
            break;
        case 9:
            // 预警发布内容
            break;
        case 10:
            // 预警信息
            break;
        case 11:
            // 天气网跳转地址
            break;
        default:
            break;
    }
    return @"";
}

// 2001006       空气质量
+ (NSString *)airInformationFromFetchNumber:(NSNumber *)fetchNumber
{
    switch (fetchNumber.integerValue)
    {
        case 0:
            // 更新时间
            break;
        case 1:
            // PM 2.5
            break;
        case 2:
            // AQI
            break;
        case 3:
            // NO2
            break;
        case 4:
            // O3
            break;
        case 5:
            // PM 10
            break;
        case 6:
            // SO2
            break;
        case 7:
            // CO
            break;
        default:
            break;
    }
    return @"";
}

// 1001001       1小时 和 3小时 小时预报
+ (NSString *)lessThanThreeHoursForecastInformationFromFetchNumber:(NSNumber *)fetchNumber
{
    switch (fetchNumber.integerValue)
    {
        case 0:
            // 预报时间
            break;
        case 1:
            // 天气现象编码
            break;
        case 2:
            // 温度
            break;
        case 3:
            // 风力
            break;
        case 4:
            // 风向
            break;
        default:
            break;
    }
    return @"";
}

// 1001001       12 小时预报
+ (NSString *)moreThanThreeHoursForecastInformationFromFetchNumber:(NSNumber *)fetchNumber
{
    switch (fetchNumber.integerValue)
    {
        case 0:
            // 预报时间
            break;
        case 1:
            // 天气现象编码
            break;
        case 2:
            // 该时间内的最高温度
            break;
        case 3:
            // 该时间内的最低温度
            break;
        case 4:
            // 风力
            break;
        case 5:
            // 风向
            break;
        default:
            break;
    }
    return @"";
}

// 1001001       24 小时预报
+ (NSString *)moreThanTwelveHoursForecastInformationFromFetchNumber:(NSNumber *)fetchNumber
{
    switch (fetchNumber.integerValue)
    {
        case 0:
            // 预报时间
            break;
        case 1:
            // 白天天气现象编码
            break;
        case 2:
            // 晚上天气现象编码
            break;
        case 3:
            // 白天温度
            break;
        case 4:
            // 晚上温度
            break;
        case 5:
            // 白天风力
            break;
        case 6:
            // 晚上风力
            break;
        case 7:
            // 白天风向
            break;
        case 8:
            // 晚上风向
            break;
        default:
            break;
    }
    return @"";
}


// 1001004       24 生活指数
+ (NSString *)moreThanTwelveHoursIndexInformationFromFetchNumber:(NSNumber *)fetchNumber
{
    switch (fetchNumber.integerValue)
    {
        case 0:
            // 预报时间
            break;
        case 1:
            // 过敏指数
            break;
        case 2:
            // 穿衣指数
            break;
        case 3:
            // 钓鱼指数
            break;
        case 4:
            // 感冒指数
            break;
        case 5:
            // 交通指数
            break;
        case 6:
            // 晾晒指数
            break;
        case 7:
            // 空气污染扩散指数
            break;
        case 8:
            // 化妆指数
            break;
        case 9:
            // 紫外线强度指数
            break;
        case 10:
            // 洗车指数
            break;
        default:
            break;
    }
    return @"";
}



// 1001004       24 生活指数
+ (NSString *)weatherPhenomenaInformationFromFetchNumber:(NSNumber *)fetchNumber
{
    switch (fetchNumber.integerValue)
    {
        case 0:
            // 晴                   Sunny
            break;
        case 1:
            // 多云                  Cloudy
            break;
        case 2:
            // 阴                   Overcast
            break;
        case 3:
            // 阵雨                  Shower
            break;
        case 4:
            // 雷阵雨                Thundershower
            break;
        case 5:
            // 雷阵雨伴有冰雹          Thundershower with hail
            break;
        case 6:
            // 雨夹雪                Sleet
            break;
        case 7:
            // 小雨                  Light rain
            break;
        case 8:
            // 中雨                  Moderate rain
            break;
        case 9:
            // 大雨                  Heavy rain
            break;
        case 10:
            // 暴雨                  Storm
            break;
        case 11:
            // 大暴雨                Heavy storm
            break;
        case 12:
            // 特大暴雨               Severe storm
            break;
        case 13:
            // 阵雪                  Snow flurry
            break;
        case 14:
            // 小雪                  Light snow
            break;
        case 15:
            // 中雪                  Moderate snow
            break;
        case 16:
            // 大雪                  Heavy snow
            break;
        case 17:
            // 暴雪                  Snowstorm
            break;
        case 18:
            // 雾                    Foggy
            break;
        case 19:
            // 冻雨                  Ice rain
            break;
        case 20:
            // 沙尘暴                Duststorm
            break;
        case 21:
            // 小到中雨               Light to moderate rain
            break;
        case 22:
            // 中到大雨               Moderate to heavy rain
            break;
        case 23:
            // 大到暴雨               Heavy rain to storm
            break;
        case 24:
            // 暴雨到大暴雨            Storm to heavy storm
            break;
        case 25:
            // 大暴雨到特大暴雨        Heavy to severe storm
            break;
        case 26:
            // 小到中雪               Light to moderate snow
            break;
        case 27:
            // 中到大雪               Moderate to heavy snow
            break;
        case 28:
            // 大到暴雪               Heavy snow to snowstorm
            break;
        case 29:
            // 浮尘                  Dust
            break;
        case 30:
            // 扬沙                  Sand
            break;
        case 31:
            // 强沙尘暴               Sandstorm
            break;
        case 32:
            // 浓雾                  Dense fog
            break;
        case 49:
            // 强浓雾                Strong fog
            break;
        case 53:
            // 霾                    Haze
            break;
        case 54:
            // 中度霾                Moderate haze
            break;
        case 55:
            // 重度霾                Severe haze
            break;
        case 56:
            // 严重霾                Severe haze
            break;
        case 57:
            // 大雾                  Dense fog
            break;
        case 58:
            // 特强浓雾              Extra heavy fog
            break;
        case 99:
            // 无                   Unknown
            break;
        case 301:
            // 雨                   Rain
            break;
        case 302:
            // 雪                   Snow
            break;
        default:
            break;
    }
    return @"";
}







@end
