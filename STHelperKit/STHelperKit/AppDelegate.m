//
//  AppDelegate.m
//  STHelperKit
//
//  Created by 沈兆良 on 16/7/28.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
