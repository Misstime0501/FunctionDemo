//
//  CommunicationHelper.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/20.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "CommunicationHelper.h"

static CommunicationHelper *communicationHelper = nil;


@implementation CommunicationHelper

#pragma mark - 初始

+ (CommunicationHelper *)sharedCommunicationHelper
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        communicationHelper = (CommunicationHelper *)@"CommunicationHelper";
        communicationHelper = [[CommunicationHelper alloc] init];
    });
    
    // 防止子类使用
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"CommunicationHelper"] == NO)
    {
        NSParameterAssert(nil);
    }
    return communicationHelper;
}

- (instancetype)init
{
    NSString *string = (NSString *)communicationHelper;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:@"CommunicationHelper"])
    {
        self = [super init];
        if (self)
        {
            
        }
        return self;
    }
    else
    {
        return nil;
    }
}

#pragma mark -
- (void)sendJsonRequest:(NSDictionary *)sendData
                httpURL:(NSString *)serverPath
                success:(SEL)successAction
                 failed:(SEL)failedAction
{
    if ([NSJSONSerialization isValidJSONObject:sendData])
    {
        NSError *error;
        
        NSData  *jsonData           = [NSJSONSerialization dataWithJSONObject:sendData
                                                                      options:NSJSONWritingPrettyPrinted
                                                                        error:&error];
        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
        NSURL *url                  = [NSURL URLWithString:serverPath];
        
        ASIHTTPRequest *request     = [ASIHTTPRequest requestWithURL:url];
        [request setRequestHeaders:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"gzip", @"Content-Type",
                                                                                       @"gzip", @"Accept-Type", nil]];
        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        [request addRequestHeader:@"Accept"       value:@"application/json"];
        [request setPostBody:tempJsonData];
        [request setRequestMethod:@"POST"];
        [request setDelegate:self];
        // 是否压缩请求 Body
        [request setShouldCompressRequestBody:YES];
        // 是否允许接收压缩的响应
        [request setAllowCompressedResponse:YES];
        
        [request startAsynchronous];
    }
    else
    {
        IWPFLog(@"Error: 传入的请求体不是合法的 Json 格式");
    }
}












@end
