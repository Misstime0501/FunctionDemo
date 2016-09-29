//
//  AllViewControllersTool.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/28.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "AllViewControllersTool.h"
#import "IWPFBasicNavigationController.h"
#import "IWPFWeatherViewController.h"
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"

@interface AllViewControllersTool ()

@property (nonatomic, strong) MMDrawerController        *drawerController;
@property (nonatomic, strong) LeftMenuViewController    *leftMenuController;
@property (nonatomic, strong) RightMenuViewController   *rightMenuController;

@end

@implementation AllViewControllersTool

- (LeftMenuViewController *)leftMenuController
{
    if (!_leftMenuController) {
        _leftMenuController = [[LeftMenuViewController alloc] init];
    }
    return _leftMenuController;
}

- (RightMenuViewController *)rightMenuController
{
    if (!_rightMenuController) {
        _rightMenuController = [[RightMenuViewController alloc] init];
    }
    return _rightMenuController;
}

- (MMDrawerController *)drawerController
{
    if (!_drawerController) {
        _drawerController = [[MMDrawerController alloc] init];
        _drawerController.showsShadow = YES;
        [_drawerController setMaximumLeftDrawerWidth:[UIScreen mainScreen].bounds.size.width * 0.75];
        [_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
        [_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
        
        [_drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
            
            MMDrawerControllerDrawerVisualStateBlock block = [MMDrawerVisualState slideVisualStateBlock];
            if (block) {
                block(drawerController,drawerSide,percentVisible);
            }
        }];
        
        [_drawerController setLeftDrawerViewController:_leftMenuController];
        [_drawerController setRightDrawerViewController:_rightMenuController];
    }
    return _drawerController;
}

+ (void)createViewControllerWithIndex:(NSUInteger)index
{
    AllViewControllersTool *dispatchTool = [AllViewControllersTool shareAllViewControllersTool];
    [dispatchTool openViewControllerWithIndex:index];
}

+ (instancetype)shareAllViewControllersTool
{
    static AllViewControllersTool *vcTool = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vcTool = [[AllViewControllersTool alloc] init];
    });
    return vcTool;
}

- (void)openViewControllerWithIndex:(NSUInteger)index
{
    switch (index)
    {
        case 0:
        {
            static IWPFBasicNavigationController *navViewController = nil;
            
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                IWPFWeatherViewController *weatherViewController = [[IWPFWeatherViewController alloc] init];
                navViewController = [[IWPFBasicNavigationController alloc] initWithRootViewController:weatherViewController];
            });
            [self.drawerController setCenterViewController:navViewController];
            [UIApplication sharedApplication].keyWindow.rootViewController = self.drawerController;
            [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
            
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            
        }
            break;
            
        default:
            break;
    }
}



@end
