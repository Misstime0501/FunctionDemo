//
//  MacroOfDefine_Function.h
//  TestDemo
//
//  Created by Chen Li on 16/9/19.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#ifndef MacroOfDefine_Function_h
#define MacroOfDefine_Function_h

#pragma mark - 控制台输出
#ifdef DEBUG
#define IWPFLog(fmt, ...) \
    NSLog((@"%s [%d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define IWPFLog(...)
#endif

#pragma mark - 通知中心
#define LRNotificationCenter            [NSNotificationCenter defaultCenter]

#pragma mark - 颜色设置
#define LRRandomColor                   [UIColor colorWithRed:arc4random_uniform(256)/255.0 \
                                                        green:arc4random_uniform(256)/255.0 \
                                                         blue:arc4random_uniform(256)/255.0 \
                                                        alpha:1.0]

#define LRRGBColor(r, g, b)             [UIColor colorWithRed:(r)/255.0 \
                                                        green:(g)/255.0 \
                                                         blue:(b)/255.0 \
                                                        alpha:1.0]

#define LRRGBAColor(r, g, b, a)         [UIColor colorWithRed:(r)/255.0 \
                                                        green:(r)/255.0 \
                                                         blue:(r)/255.0 \
                                                        alpha:a]

#define LRClearColor                    [UIColor clearColor]

#define LRViewBorderRadius(View, Radius, Width, Color)      \
                                        [View.layer setCornerRadius:(Radius)];\
                                        [View.layer setMasksToBounds:YES];\
                                        [View.layer setBorderWidth:(Width)];\
                                        [View.layer setBorderColor:[Color CGColor]]

#pragma mark - 角度转为弧度
#define LRDegreesToRadian(x)            (M_PI * (x) / 180.0)
#pragma mark - 弧度转为角度
#define LRRadianToDegrees(radian)       (radian * 180.0) / (M_PI)



// 加载
#define IWPFShowNetworkActivityIndicator()          [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
// 收起加载
#define IWPFHideNetworkActivityIndicator()          [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
// 设置加载
#define IWPFNetworkActivityIndicatorVisible(x)      [UIApplication sharedApplication].networkActivityIndicatorVisible = x

























//#define kWindow [UIApplication sharedApplication].keyWindow
//
//#define kBackView         for (UIView *item in kWindow.subviews) { \
//if(item.tag == 10000) \
//{ \
//[item removeFromSuperview]; \
//UIView * aView = [[UIView alloc] init]; \
//aView.frame = [UIScreen mainScreen].bounds; \
//aView.tag = 10000; \
//aView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3]; \
//[kWindow addSubview:aView]; \
//} \
//} \
//
//#define kShowHUDAndActivity kBackView;[MBProgressHUD showHUDAddedTo:kWindow animated:YES];kShowNetworkActivityIndicator()
//
//#define kHiddenHUD [MBProgressHUD hideAllHUDsForView:kWindow animated:YES]
//
//#define kRemoveBackView         for (UIView *item in kWindow.subviews) { \
//if(item.tag == 10000) \
//{ \
//[UIView animateWithDuration:0.4 animations:^{ \
//item.alpha = 0.0; \
//} completion:^(BOOL finished) { \
//[item removeFromSuperview]; \
//}]; \
//} \
//} \
//
//#define kHiddenHUDAndAvtivity kRemoveBackView;kHiddenHUD;HideNetworkActivityIndicator()






#define WAIT                                                                \
do {                                                                        \
    [self expectationForNotification:@"RSBaseTest" object:nil handler:nil]; \
    [self waitForExpectationsWithTimeout:60 handler:nil];                   \
} while (0);


#define NOTIFY                                                              \
[[NSNotificationCenter defaultCenter] postNotificationName:@"RSBaseTest" object:nil];


#endif /* MacroOfDefine_Function_h */
