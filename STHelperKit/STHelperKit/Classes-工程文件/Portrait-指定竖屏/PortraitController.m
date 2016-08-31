//
//  PortraitController.m
//  STHelperKit
//
//  Created by ST on 16/8/30.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "PortraitController.h"
#import "AppDelegate.h"
@interface PortraitController ()
/** 1. */
@property(nonatomic, strong)UIButton *buttonBack ;
@end

@implementation PortraitController

#pragma mark - --- 1.init 生命周期 ---

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.buttonBack];
}

- (void)viewWillAppear:(BOOL)animated
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = 0;
    [self switchToPortrait];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = 1;
    [super viewWillDisappear:animated];
}
#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---
- (void)backVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - --- 4.private methods 私有方法 ---
//点击按钮旋转到横屏
- (void)switchToLandscape
{
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
    //上一句话是防止手动先把设备置为横屏,导致下面的语句失效.
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeLeft] forKey:@"orientation"];
}

//点击返回旋转到竖屏
- (void)switchToPortrait
{
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeLeft] forKey:@"orientation"];
    //上一句话是防止手动先把设备置为竖屏,导致下面的语句失效.
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];
}
#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--
- (UIButton *)buttonBack
{
    if (!_buttonBack) {
        _buttonBack = [[UIButton alloc]initWithFrame:CGRectMake(20, 150, 200, 50)];
        [_buttonBack setBackgroundColor:[UIColor greenColor]];
        [_buttonBack setTitle:@"Dismiss Controller" forState:UIControlStateNormal];
        [_buttonBack addTarget:self action:@selector(backVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonBack;
}
@end
