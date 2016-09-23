//
//  MacroOfDefine_Const.h
//  TestDemo
//
//  Created by Chen Li on 16/9/19.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#ifndef MacroOfDefine_Const_h
#define MacroOfDefine_Const_h

#pragma mark - Static Coordinate Const

#define ZERO                                                        0
#define SCREEN_SIZE                                                 [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH                                                [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT                                               [UIScreen mainScreen].bounds.size.height



//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上
//#define SCREEN_WIDTH        \
//([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? \
//[UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale : \
//[UIScreen mainScreen].bounds.size.width)
//
//
//#define SCREENH_HEIGHT      \
//([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? \
//[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : \
//[UIScreen mainScreen].bounds.size.height)
//
//#define SCREEN_SIZE         \
//([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? \
//CGSizeMake([UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale, [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale) : \
//[UIScreen mainScreen].bounds.size)
//#else
//#define SCREEN_WIDTH                    [UIScreen mainScreen].bounds.size.width
//#define SCREENH_HEIGHT                  [UIScreen mainScreen].bounds.size.height
//#define SCREEN_SIZE                     [UIScreen mainScreen].bounds.size
//#endif




#define EMPTY_STR                                                   @""









#endif /* MacroOfDefine_Const_h */
