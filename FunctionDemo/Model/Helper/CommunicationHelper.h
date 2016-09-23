//
//  CommunicationHelper.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/20.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASIHTTPRequest.h"
#import "MacroOfDefine.h"
#import "IWPFBlockTypeHelper.h"

@interface CommunicationHelper : NSObject

//@property (weak, nonatomic) 


+ (CommunicationHelper *)sharedCommunicationHelper;

- (instancetype)init
    NS_DESIGNATED_INITIALIZER;


- (void)fetchWeatherInformation:(BOOL)asynchronous;
- (void)fetchWeatherInformationSucc:(ASIHTTPRequest *)request;
- (void)fetchWeatherInformationFail:(ASIHTTPRequest *)request;

@end
