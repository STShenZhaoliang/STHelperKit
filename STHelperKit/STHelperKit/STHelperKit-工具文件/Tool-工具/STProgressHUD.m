//
//  STProgressHUD.m
//  STHelperKit
//
//  Created by 沈兆良 on 16/8/3.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "STProgressHUD.h"

@implementation STProgressHUD

#pragma mark - --- init 视图初始化 ---

#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---
+ (void)showWithText:(NSString *)text AddedTo:(UIView *)view
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hub setMode:MBProgressHUDModeText];
    [hub setAnimationType:MBProgressHUDAnimationZoomOut];
    [hub.label setText:text];
    [hub hideAnimated:YES afterDelay:0.7];
}
#pragma mark - --- setters 属性 ---

#pragma mark - --- getters 属性 —

@end
