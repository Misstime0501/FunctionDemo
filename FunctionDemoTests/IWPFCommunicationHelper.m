//
//  IWPFCommunicationHelper.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/20.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CommunicationHelper.h"

#import "IWPFTestCase.h"


@interface IWPFCommunicationHelper : IWPFTestCase

@end

@implementation IWPFCommunicationHelper

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFetchWeatherInformation
{
    CommunicationHelper *communicationHelper = [CommunicationHelper sharedCommunicationHelper];
    
    [communicationHelper fetchWeatherInformation:NO];
    
    
    
}



@end
