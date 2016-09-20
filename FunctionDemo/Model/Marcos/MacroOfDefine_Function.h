//
//  MacroOfDefine_Function.h
//  TestDemo
//
//  Created by Chen Li on 16/9/19.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#ifndef MacroOfDefine_Function_h

#define MacroOfDefine_Function_h


#ifdef DEBUG
#define IWPFLog(fmt, ...) \
    NSLog((@"%s [%d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define IWPFLog(...)
#endif


#endif /* MacroOfDefine_Function_h */
