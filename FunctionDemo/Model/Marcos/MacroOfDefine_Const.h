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

#define HUNDRED_OFFSET                                              100




#pragma mark - Launch View 
#define LAUNCH_STATIC_IMAGE_NAME                                    @"defaultLaunchImage"
#define LAUNCH_IMAGEVIEW_NAME                                       @"launchImageViewName"
#define LAUNCH_SPLASH_LOGO_IMAGE_NAME                               @"launchSplashLogoName"






#pragma mark - Left Menu
#define LEFT_MENU_TITLE_ARRAY                                       @[@"用户登录", @"帮助支持", @"意见反馈", \
                                                                      @"关于我们", @"合作方式", @"好评鼓励", @"设置"]
#define LEFT_MENU_CELL_IMAGE_ARRAY                                  @[@"", @"", @"", \
                                                                      @"", @"", @"", @""]
#define LEFT_MENU_CELL_HEIGHT                                       55


#pragma mark - Left Menu Table Cell
#define LEFT_MENU_TABLE_CELL_WIDTH                                  SCREEN_WIDTH
#define LEFT_MENU_TABLE_CELL_HEIGHT                                 LEFT_MENU_CELL_HEIGHT

#define LEFT_MENU_TABLE_CELL_IMAGE_VIEW_X                           30
#define LEFT_MENU_TABLE_CELL_IMAGE_VIEW_Y                           9
#define LEFT_MENU_TABLE_CELL_IMAGE_VIEW_WIDTH                       35
#define LEFT_MENU_TABLE_CELL_IMAGE_VIEW_HEIGHT                      35

#define LEFT_MENU_TABLE_CELL_LABEL_X                                90
#define LEFT_MENU_TABLE_CELL_LABEL_Y                                10
#define LEFT_MENU_TABLE_CELL_LABEL_WIDTH                            60
#define LEFT_MENU_TABLE_CELL_LABEL_HEIGHT                           35





#define ADDSITE_SEARCHBAR_HEIGHT                                    44
#define ADDSITE_SEARCHBAR_PLACEHOLDER                               @"更多城市"






#pragma mark - 请求地址



#define BASE_URL_STRING                                             @"http://"

#define HTTPS_LAUCH_SCREEN_IMAGE                                    @""



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
