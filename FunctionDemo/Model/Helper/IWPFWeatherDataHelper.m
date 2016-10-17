//
//  IWPFWeatherDataHelper.m
//  FunctionDemo
//
//  Created by Chen Li on 2016/10/12.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFWeatherDataHelper.h"
#import "IWPFCommunicationHelper.h"
#import "IWPFWeatherTransform.h"

#import "MacroOfDefine.h"

/**
 
 产品使用概述
 
 产品通过http get方式请求，请求接口由固定URL加4类参数组成，完整URL需客户端经过固定方式加密后使用。
 接口请求规则
 
 接口URL:
 
 http://api.weatherdt.com/common/?area=站点ID&type=天气数据大类[数据小类]&key=iBmCdU7VCPvFq1XJ52jAAknYJ%2B8 %3D。4类参数分别为请求时间（date）、站表ID(area)、天气数据大类(type)和key。
 
 站点ID(area)规则：
 
 站点根据地区分为中国站点、国外站点、旅游景点站点和机场站点四大类。接口支持单站点请求和多站点请求，若为单站点请求，则在接口中只传入一个站点ID作为参数，若为多站点请求，则在接口中用“|”分隔拼接站点ID作为参数，一次最多拼接20个站表ID，且拼接的站点ID必须为同一地区站点，否则接口无效。站点ID见附件文档。
 单站点示例：URL= http://api.weatherdt.com/common/?area=areaId&type=[天气数据大类]&key=iBmCdU7VCPvFq 1XJ52jAAknYJ%2B8%3D
 多站点示例：URL= http://api.weatherdt.com/common/?area=areaId|areaId&type=[天气数据大]&key=iBmCdU7VCPvFq 1XJ52jAAknYJ%2B8%3D
 
 天气数据大类（type）规则：
 
 1)天气数据大类可以分为：预报、实况、预警、指数和空气质量5大类，其中预报和指数又可根据地区分为不同的种类。每一大类天气数据包含多个天气数据小类。天气数据大类和天气数据小类对应的编码见附件文档。
 
 
 
 */




@implementation IWPFWeatherDataHelper

+ (void)fetchWeatherDataCityName:(NSString *)cityName
                     requestType:(NSString *)requestType
                         success:(IWPFRequestSuccessBlock)success
                         failure:(IWPFRequestFailureBlock)failure
{
    NSString *requestPath = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@%@%@%@",
                             WEATHER_RQ_PATH,
                             WEATHER_RQ_AREA, [IWPFWeatherTransform integerNumberWithAddressText:cityName], WEATHER_RQ_CONNECTOR,
                             WEATHER_RQ_TYPE, requestType, WEATHER_RQ_CONNECTOR,
                             WEATHER_RQ_KEY , WEATHER_RQ_PRIVATE_KEY];
    IWPFLog(@"%@", requestPath);
    [IWPFCommunicationHelper requestMethUseGetWithPath:requestPath
                                                params:nil
                                               success:^(id responseObject) {
                                                   success(responseObject);
                                                        }
                                               failure:^(NSError *error) {
                                                   failure(error);
    }];
    
}


+ (NSArray *)allCitiesDics
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"allCitiesDics" ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:filePath];
}


+ (NSString *)cityidOfCityname:(NSString *)cityname
{
    NSArray *allCitiesDics = [IWPFWeatherDataHelper allCitiesDics];
    for (NSInteger i = 0; i < allCitiesDics.count; i++)
    {
        NSDictionary *cityDic = allCitiesDics[i];
        if ([cityname isEqualToString:cityDic[@"city"]])
        {
            return cityDic[@"id"];
        }
    }
    return nil;
}

@end
