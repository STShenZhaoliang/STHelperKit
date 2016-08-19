//
//  AppDelegate.m
//  STHelperKit
//
//  Created by 沈兆良 on 16/7/28.
//  Copyright © 2016年 沈兆良. All rights reserved.
//


#pragma mark - --- Controller 控制器 ---
#import "ViewController.h"
#import "ViewTest0Controller.h"
//#import "NetworkController.h"
#pragma mark - --- View 视图 ---

#pragma mark - --- Model 数据 ---

#pragma mark - --- Tool 工具 ---
#import "AppDelegate.h"
//#import "YTKNetworkConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /** 1.配置网络 */
    [self setupNetwork];

    /** 2.配置视图 */
    [self setupUI];
    return YES;
}

/** 1.配置网络 */
- (void)setupNetwork
{
//    YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
//    NSDictionary *infoDictionary = [NSBundle mainBundle].infoDictionary;
//    NSString *baseUrl = [infoDictionary valueForKeyPath:@"STCommon.BaiduUrl"];
//    [config setBaseUrl:baseUrl];
}

/** 2.配置视图 */
- (void)setupUI
{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [ViewTest0Controller new];
    [self.window makeKeyAndVisible];
}


@end
