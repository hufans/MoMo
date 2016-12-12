//
//  AppDelegate.m
//  The Other
//
//  Created by 胡凡 on 12/7/16.
//  Copyright © 2016 胡凡. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    MainTabBarController *main = [[MainTabBarController alloc] init];
//    
//    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
//    homeNav.tabBarItem.title = @"广场";
//    homeNav.tabBarItem.image = [[UIImage imageNamed:@"Home"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Home-selected"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    
//    UINavigationController *msgNav = [[UINavigationController alloc] initWithRootViewController:[MessageViewController new]];
//    msgNav.tabBarItem.title = @"消息";
//    msgNav.tabBarItem.image = [[UIImage imageNamed:@"Message"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    msgNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Message-selected"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    
//    UINavigationController *contactNav = [[UINavigationController alloc] initWithRootViewController:[ContactViewController new]];
//    contactNav.tabBarItem.title = @"联系人";
//    contactNav.tabBarItem.image = [[UIImage imageNamed:@"Contact"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    contactNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Contact-selected"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    
//    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:[MeViewController new]];
//    meNav.tabBarItem.title = @"我";
//    meNav.tabBarItem.image = [[UIImage imageNamed:@"Me"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    meNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Me-selected"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    
//    [main setViewControllers:@[homeNav,msgNav,contactNav,meNav]];
//    
//    self.window.rootViewController = main;
    
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
