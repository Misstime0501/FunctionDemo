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

+ (void)fetchWeatherDataCityName:(NSString *)cityName
                         success:(IWPFRequestSuccessBlock)success
                         failure:(IWPFRequestFailureBlock)failure;








@end
