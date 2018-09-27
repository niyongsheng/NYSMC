//
//  AppDelegate.m
//  NYSCake_Demo
//
//  Created by 倪刚 on 2018/9/25.
//  Copyright © 2018年 NiYongsheng. All rights reserved.
//

#import "AppDelegate.h"
#import <NYSMC/NYSMC.h>

#import "NYSCSheelViewController.h"
#import "NYSCApplicationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化NYSC
    [NYSCake initWithEstimatedAuditDays:2 PostURL:@"http://chicken.qmook.com:8080/api/shelf/getReviewData2" ValidateParameters:nil BootMethod:NYSCBootMethod_Cold];
    // 选择分支
    [NYSCake chooseViewControllerWithPriorityType:NYSCPriorityType_Server_Status errorBootFromType:BootFrom_Sheel matchSheelBlock:^{
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[NYSCSheelViewController alloc] init]];
        [self.window makeKeyAndVisible];
    } ApplicationBlock:^{
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[NYSCApplicationViewController alloc] init]];
        [self.window makeKeyAndVisible];
    }];
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
