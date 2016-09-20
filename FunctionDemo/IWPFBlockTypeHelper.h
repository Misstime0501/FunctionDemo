//
//  IWPFBlockTypeHelper.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/20.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#ifndef IWPFBlockTypeHelper_h
#define IWPFBlockTypeHelper_h


/**
 数据通信 block 返回格式

 @param succeeded       请求是否成功
 @param headInformation 返回数据头信息
 @param bodyInformation 返回数据体信息
 @param error           异常信息
 */
typedef void (^IWPFRequestResultBlock)(BOOL succeeded, NSDictionary *headInformation, NSDictionary *bodyInformation, NSError *error);


#endif /* IWPFBlockTypeHelper_h */
