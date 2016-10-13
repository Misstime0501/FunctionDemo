//
//  IWPFErrorHelper.m
//  FunctionDemo
//
//  Created by Chen Li on 2016/10/13.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFErrorHelper.h"

@implementation IWPFErrorHelper


// 注释中有个 CC
+ (NSString *)weatherErrorInformation:(NSUInteger)errorCode
{
    switch (errorCode)
    {
        case 1000:
            // 检查参数拼写
            return @"参数错误";
            break;
        case 1001:
            // 检查请求 IP
            return @"订制IP错误";
            break;
        case 1002:
            // 请在指定域名下请求数据
            return @"订制域名错误";
            break;
        case 1003:
            // 请重新购买服务
            return @"订单过期";
            break;
        case 1004:
            // 请合理访问接口
            return @"访问次数超限";
            break;
        case 1005:
            // 单次访问请少于 20 个站点
            return @"站点数过多错误";
            break;
        case 1006:
            // 访问接口路径错误
            return @"访问接口路径错误";
            break;
        case 1100:
            // 请稍后访问
            return @"连接超时";
            break;
        case 1101:
            // 检查密钥
            return @"密钥错误";
            break;
        case 1102:
            // 请稍后访问
            return @"系统无响应";
            break;
        case 1200:
            // 检查请求站点
            return @"请求无效站点错误";
            break;
        case 1201:
            // 检查站点数量或要素数量
            return @"请求站点与要素过多错误";
            break;
        case 1300:
            // 检查要素请求格式
            return @"请求要素格式错误";
            break;
        case 1301:
            // 检查定制类型数据
            return @"请求未定制类型数据";
            break;
        case 1302:
            // 检查请求类型的定制天数
            return @"请求类型定制天数超出错误";
            break;
        case 1303:
            // 检查站点数量或指数要素数量
            return @"请求多站点与指数多要素错误";
            break;
        default:
            break;
    }
    return @"";
}

@end
