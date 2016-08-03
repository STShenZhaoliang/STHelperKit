//
//  STNetwork.m
//  STHelperKit
//
//  Created by 沈兆良 on 16/8/3.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "STNetwork.h"

NS_ASSUME_NONNULL_BEGIN

@interface STNetwork ()<YTKRequestDelegate>
@end

NS_ASSUME_NONNULL_END


@implementation STNetwork

#pragma mark - --- init 视图初始化 ---

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - --- delegate 视图委托 ---
- (void)requestFinished:(YTKBaseRequest *)request{
    [STProgressHUD showWithText:@"成功获取信息" AddedTo:self.view];
}

- (void)requestFailed:(YTKBaseRequest *)request{
    [STProgressHUD showWithText:@"请检查网络设置" AddedTo:self.view];
}

- (void)clearRequest{
    [STProgressHUD showWithText:@"" AddedTo:self.view];
}
#pragma mark - --- event response 事件相应 ---

- (void)start
{
    [STProgressHUD showToView:self.view];
    [super start];

}
#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- setters 属性 ---

#pragma mark - --- getters 属性 —

- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSDictionary *infoDictionary = [NSBundle mainBundle].infoDictionary;
    NSString *apikey = [infoDictionary valueForKeyPath:@"STCommon.BaiduApikey"];
    return @{@"apikey":apikey};
}
@end
