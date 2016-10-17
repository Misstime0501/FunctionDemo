//
//  IWPFWeatherDataHelper.h
//  FunctionDemo
//
//  Created by Chen Li on 2016/10/12.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWPFBlockTypeHelper.h"


@interface IWPFWeatherDataHelper : NSObject



// http://api.weatherdt.com/common/?area=站点ID&type=天气数据大类[数据小类]&key=iBmCdU7VCPvFq1XJ52jAAknYJ%2B8
// @[ @"forecast" , @"observe" , @"alarm" , @"index" , @"air"]

+ (void)fetchWeatherDataCityName:(NSString *)cityName
                     requestType:(NSString *)requestType
                         success:(IWPFRequestSuccessBlock)success
                         failure:(IWPFRequestFailureBlock)failure;



+ (NSString *)cityidOfCityname:(NSString *)cityname;








@end
