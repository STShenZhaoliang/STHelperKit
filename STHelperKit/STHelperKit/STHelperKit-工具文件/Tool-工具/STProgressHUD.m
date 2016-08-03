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
+ (STProgressHUD *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---
+ (void)showWithText:(NSString *)text AddedTo:(UIView *)view
{
    dispatch_async(dispatch_get_main_queue(), ^{
        STProgressHUD *hud = [STProgressHUD sharedInstance];
        hud.frame = view.frame;
        hud.removeFromSuperViewOnHide = YES;
        [view addSubview:hud];
        [hud showAnimated:YES];
        [hud setMode:MBProgressHUDModeText];
        [hud setAnimationType:MBProgressHUDAnimationZoomOut];
        [hud.label setText:text];
        [hud hideAnimated:YES afterDelay:0.7];
    });
}

+ (void)showToView:(UIView *)view
{
    dispatch_async(dispatch_get_main_queue(), ^{
        STProgressHUD *hud = [STProgressHUD sharedInstance];
        hud.frame = view.frame;
        hud.removeFromSuperViewOnHide = YES;
        [view addSubview:hud];
        [hud showAnimated:YES];
    });
}
#pragma mark - --- setters 属性 ---

#pragma mark - --- getters 属性 —

@end
