//
//  UIColor+Extension.h
//  FunctionDemo
//
//  Created by Chen Li on 16/9/28.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
