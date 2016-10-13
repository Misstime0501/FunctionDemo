//
//  IWPFWeatherTransform.h
//  FunctionDemo
//
//  Created by Chen Li on 2016/10/12.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 数据信息 , 之后写入本地进行读取
 
 AREAID     NAMEEN      NAMECN  DISTRICTC   DISTRICTCN  PROVEN    PROVCN NATIONEN  NATIONCN
 
 101010100	beijing     北京      beijing         北京	beijing     北京	china	中国
 101010200	haidian     海淀      beijing         北京	beijing     北京	china	中国
 101010300	chaoyang	朝阳      beijing         北京	beijing     北京	china	中国
 101010400	shunyi      顺义      beijing         北京	beijing     北京	china	中国
 101010500	huairou     怀柔      beijing         北京	beijing     北京	china	中国
 101010600	tongzhou	通州      beijing         北京	beijing     北京	china	中国
 101010700	changping	昌平      beijing         北京	beijing     北京	china	中国
 101010800	yanqing     延庆      beijing         北京	beijing	    北京	china	中国
 101010900	fengtai     丰台      beijing         北京	beijing     北京	china	中国
 101011000	shijingshan	石景山     beijing         北京	beijing     北京	china	中国
 101011100	daxing      大兴      beijing         北京	beijing     北京	china	中国
 101011200	fangshan	房山      beijing         北京	beijing     北京	china	中国
 101011300	miyun       密云      beijing         北京	beijing     北京	china	中国
 101011400	mentougou	门头沟     beijing         北京	beijing     北京	china	中国
 101011500	pinggu      平谷      beijing         北京	beijing     北京	china	中国
 101020100	shanghai	上海      shanghai        上海	shanghai	上海	china	中国
 101020200	minhang     闵行      shanghai        上海	shanghai	上海	china	中国
 101020300	baoshan     宝山      shanghai        上海	shanghai	上海	china	中国
 101020500	jiading     嘉定      shanghai        上海	shanghai	上海	china	中国
 101020600	pudongxinqu	浦东新区   shanghai        上海	shanghai	上海	china	中国
 101020700	jinshan     金山      shanghai        上海	shanghai	上海	china	中国
 101020800	qingpu      青浦      shanghai        上海	shanghai	上海	china	中国
 101020900	songjiang	松江      shanghai        上海	shanghai	上海	china	中国
 101021000	fengxian	奉贤      shanghai        上海	shanghai	上海	china	中国
 101021100	chongming	崇明      shanghai        上海	shanghai	上海	china	中国
 101021200	xuhui       徐汇      shanghai        上海	shanghai	上海	china	中国
 101280101	guangzhou	广州      guangzhou       广州	guangdong	广东	china	中国
 101280102	panyu       番禺      guangzhou       广州	guangdong	广东	china	中国
 101280103	conghua     从化      guangzhou       广州	guangdong	广东	china	中国
 101280104	zengcheng	增城      guangzhou       广州	guangdong	广东	china	中国
 101280105	huadu       花都      guangzhou       广州	guangdong	广东	china	中国
 101280601	shenzhen	深圳      shenzhen        深圳	guangdong	广东	china	中国
 
 */

@interface IWPFWeatherTransform : NSObject

// 通过城市名得到对应的城市 areaid
+ (NSString *)integerNumberWithAddressText:(NSString *)addressText;

// 通过 areaid 获取城市名
+ (NSString *)fontTextWithAddressNumber:(NSNumber *)number;

#pragma mark - 常规预报
// 1001001       1小时 和 3小时 小时预报
+ (NSString *)lessThanThreeHoursForecastInformationFromFetchNumber:(NSNumber *)fetchNumber;

// 1001001       12 小时预报
+ (NSString *)moreThanThreeHoursForecastInformationFromFetchNumber:(NSNumber *)fetchNumber;

// 1001001       24 小时预报
+ (NSString *)moreThanTwelveHoursForecastInformationFromFetchNumber:(NSNumber *)fetchNumber;

// 天气现象
+ (NSString *)weatherPhenomenaInformationFromFetchNumber:(NSNumber *)fetchNumber;

#pragma mark - 实况
// 1001002       实况
+ (NSString *)observeInformationFromFetchNumber:(NSNumber *)fetchNumber;

#pragma mark - 预警
// 1001003       预警
+ (NSString *)alarmInformationFromFetchNumber:(NSNumber *)fetchNumber;

// 预警信号
+ (NSString *)alarmNumberInformationFromFetchNumber:(NSNumber *)fetchNumber;

// 预警信号
+ (NSString *)alarmLevelInformationFromFetchNumber:(NSNumber *)fetchNumber;

#pragma mark - 生活指数
// 1001004       24 生活指数
+ (NSString *)moreThanTwelveHoursIndexInformationFromFetchNumber:(NSNumber *)fetchNumber;

#pragma mark - 空气质量
// 2001006       空气质量
+ (NSString *)airInformationFromFetchNumber:(NSNumber *)fetchNumber;

#pragma mark - 风
// 风向
+ (NSString *)windDirectionInformationFromFetchNumber:(NSNumber *)fetchNumber;

// 风力
+ (NSString *)windPowerInformationFromFetchNumber:(NSNumber *)fetchNumber;


@end
