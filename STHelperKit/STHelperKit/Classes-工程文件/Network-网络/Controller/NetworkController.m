//
//  NetworkController.m
//  STHelperKit
//
//  Created by 沈兆良 on 16/7/29.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#pragma mark - --- Controller 控制器 ---
#import "NetworkController.h"

#pragma mark - --- View 视图 ---

#pragma mark - --- Model 数据 ---

#pragma mark - --- Tool 工具 ---
#import "ApiWeatherservice.h"

@interface NetworkController ()
/** 1. */
@property (nonatomic, strong) ApiWeatherservice *apiWeather;
@end

@implementation NetworkController

#pragma mark - --- lift cycle 生命周期 ---
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.apiWeather.cityname = @"北京";
    [self.apiWeather startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%s %@", __FUNCTION__, request.responseJSONObject);
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%s %@", __FUNCTION__, request);
    }];
}
#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- setters 属性 ---

#pragma mark - --- getters 属性 ---
- (ApiWeatherservice *)apiWeather
{
    if (!_apiWeather) {
        _apiWeather = [[ApiWeatherservice alloc]init];
    }
    return _apiWeather;
}
@end
