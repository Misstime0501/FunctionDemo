//
//  IWPFBasisNavigationControllerViewController.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/26.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFBasicNavigationController.h"

@interface IWPFBasicNavigationController ()

@end

@implementation IWPFBasicNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //动态更改导航背景 / 样式
    //开启编辑
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置导航条背景颜色
    [bar setBarTintColor:[UIColor clearColor]];
    //设置字体颜色
    [bar setTintColor:[UIColor whiteColor]];
    //设置样式
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                  NSFontAttributeName            : [UIFont boldSystemFontOfSize:16] }];
    
    //设置导航条按钮样式
    //开启编辑
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置样式
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                   NSFontAttributeName            : [UIFont boldSystemFontOfSize:16] }
                        forState:UIControlStateNormal];
}

/**
 *  更改状态栏颜色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//设置状态栏是否隐藏
- (BOOL)prefersStatusBarHidden
{
    return NO;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if ([viewController isKindOfClass:[WebViewController class]]) {
//        
//        //设置左耳目
//        UIBarButtonItem *left = [UIBarButtonItem itemWithNormalIcon:@"navigationbar_back" highlightedIcon:@"navigationbar_back_highlighted" target:self action:@selector(back)];
//        
//        //添加左耳目
//        viewController.navigationItem.leftBarButtonItem = left;
//    }
    
    [super pushViewController:viewController animated:animated];
}


- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
