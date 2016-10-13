//
//  IWPFTools.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/26.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacroOfDefine.h"

@interface IWPFTools : NSObject

/**
 *  读取 UserDefaults 中存储信息的方法
 *
 *  @param keyName 键值
 *
 *  @return 返回对象信息
 */
+ (id)readUserDefaults:(NSString *)keyName;

/**
 *  写入 UserDefaults 信息的方法
 *
 *  @param keyName 键值
 *  @param value   值
 */
+ (void)writeUserDefaults:(NSString *)keyName value:(id)value;

/**
 判断传入的对象是否为空

 @param object 对象

 @return  Yes 为 null , No 为非 null
 */
+ (BOOL)checkObjectEqualNull:(id)object;

/**
 判断传入的字符串是否为空
 
 @param string 对象
 
 @return  Yes 为 null , No 为非 null
 */
+ (BOOL)checkStringEqualNull:(NSString *)string;

/**
 用 NSJSON 将 NSDictionary 转换为 NSData

 @param dictionary 字典

 @return 二进制数据
 */
+ (NSData *)useJsonChangeDictionaryToData:(NSDictionary *)dictionary;

/**
 检查文字是否安全

 @param checkString 检查的字符串

 @return 返回的安全字符串
 */
+ (NSString *)safeString:(NSString *)checkString;


//获取当前时间
//format: @"yyyy-MM-dd HH:mm:ss"、@"yyyy年MM月dd日 HH时mm分ss秒"
+ (NSString *)currentDateWithFormat:(NSString *)format;

@end
