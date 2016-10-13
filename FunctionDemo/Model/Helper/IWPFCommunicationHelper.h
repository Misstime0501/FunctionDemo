//
//  CommunicationHelper.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/20.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"

#import "MacroOfDefine.h"
#import "IWPFBlockTypeHelper.h"


@interface IWPFCommunicationClient : AFHTTPSessionManager

+ (instancetype)sharedCommunicationClient;

@end


@interface IWPFCommunicationHelper : NSObject


+ (void)requestMethUseGetWithPath:(NSString *)path
                           params:(NSDictionary *)params
                          success:(IWPFRequestSuccessBlock)success
                          failure:(IWPFRequestFailureBlock)failure;


+ (void)requestMethUsePostWithPath:(NSString *)path
                           params:(NSDictionary *)params
                          success:(IWPFRequestSuccessBlock)success
                          failure:(IWPFRequestFailureBlock)failure;

+ (void)cancelAllRequest;


@end
