//
//  CommunicationHelper.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/20.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "AFNetworking.h"
#import "IWPFCommunicationHelper.h"

@implementation IWPFCommunicationClient

+ (instancetype)sharedCommunicationClient
{
    static IWPFCommunicationClient *_sharedCommunicationClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedCommunicationClient = [[IWPFCommunicationClient alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL_STRING]];
        _sharedCommunicationClient.responseSerializer = [AFJSONResponseSerializer serializer];
        
        _sharedCommunicationClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                                                                     @"text/html",
                                                                                                     @"text/json",
                                                                                                     @"text/javascript",
                                                                                                     @"application/x-javascript",
                                                                                                     @"text/plain",
                                                                                                     @"image/gif",
                                                                                                     nil];
        _sharedCommunicationClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return _sharedCommunicationClient;
}

@end

@implementation IWPFCommunicationHelper

#pragma mark - AFN网络请求
#pragma mark POST请求
+ (void)requestMethUsePostWithPath:(NSString *)path
                            params:(NSDictionary *)params
                           success:(IWPFRequestSuccessBlock)success
                           failure:(IWPFRequestFailureBlock)failure
{
    IWPFCommunicationClient *manager = [IWPFCommunicationClient sharedCommunicationClient];
    
    [manager POST:path
       parameters:params
         progress:^(NSProgress * _Nonnull uploadProgress) { }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        if (success == nil)
                            return;
                        success(responseObject);
                    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        if (failure == nil)
                            return;
                        failure(error);
                    }
    ];
}

#pragma mark GET请求
+ (void)requestMethUseGetWithPath:(NSString *)path
                           params:(NSDictionary *)params
                          success:(IWPFRequestSuccessBlock)success
                          failure:(IWPFRequestFailureBlock)failure {
    
    IWPFCommunicationClient *manager = [IWPFCommunicationClient sharedCommunicationClient];
    
    [manager GET:path
      parameters:params
        progress:^(NSProgress * _Nonnull downloadProgress) { }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    if (success == nil)
                        return;
                    success(responseObject);
                }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    if (failure == nil)
                        return;
                    failure(error);
                }
    ];
}


#pragma mark -
#pragma mark 取消网络请求
+ (void)cancelAllRequest {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.operationQueue cancelAllOperations];
}


@end
