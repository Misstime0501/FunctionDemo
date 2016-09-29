//
//  AllViewControllersTool.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/28.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllViewControllersTool : NSObject


/**
 决定界面加载的方法类

 @param index 控制器下标
 */
+ (void)createViewControllerWithIndex:(NSUInteger)index;

@end
