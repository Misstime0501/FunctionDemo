//
//  AppDelegate.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/20.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "AppDelegate.h"
#import "MacroOfDefine.h"
#import "IWPFWeatherViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 判断系统版本号的正确姿势
    NSLog(@"%@", [[UIDevice currentDevice] systemVersion]);
    
    
    
    
    
    self.window                         = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    IWPFLog(@"window size = CGRectMark(%f, %f, %f, %f)",
            self.window.frame.origin.x,
            self.window.frame.origin.y,
            self.window.frame.size.width,
            self.window.frame.size.height);
    
    IWPFWeatherViewController *weatherView     = [[IWPFWeatherViewController alloc] init];
    
    UINavigationController *nav         = [[UINavigationController alloc] initWithRootViewController:weatherView];
    
    _revealSideViewController       = [[PPRevealSideViewController alloc] initWithRootViewController:nav];
    
    [_revealSideViewController setDirectionsToShowBounce:PPRevealSideDirectionNone];
    [_revealSideViewController setPanInteractionsWhenClosed:PPRevealSideInteractionContentView | PPRevealSideInteractionNavigationBar];
    
    self.window.rootViewController = _revealSideViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
