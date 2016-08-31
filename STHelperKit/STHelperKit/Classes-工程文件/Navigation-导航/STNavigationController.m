//
//  STNavigationController.m
//  STHelperKit
//
//  Created by ST on 16/8/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "STNavigationController.h"

@interface STNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation STNavigationController

#pragma mark - --- 1.init 生命周期 ---

- (void)loadView
{
    [super loadView];
    [self.navigationBar setTintColor:[UIColor magentaColor]];
    [self.navigationBar setBarTintColor:[UIColor grayColor]];
    [self.navigationBar setBackgroundColor:[UIColor redColor]];
    [self.navigationBar setTranslucent:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}
#pragma mark - --- 2.delegate 视图委托 ---

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

#pragma mark - --- 3.event response 事件相应 ---
- (void)backViewController
{
    [self popViewControllerAnimated:YES];
}
#pragma mark - --- 4.private methods 私有方法 ---
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
{
    // 1.设置TabBar的隐藏和控制器的属性
    self.edgesForExtendedLayout  = UIRectEdgeNone;
    [viewController setAutomaticallyAdjustsScrollViewInsets:NO];
    [viewController.view setBackgroundColor:[UIColor whiteColor]];
    // 2.设置视图
    if (self.viewControllers.count > 0) {
        // 1.自动显示和隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        // 2.设置左边的Item
        viewController.navigationItem.leftBarButtonItem = [STBarButtonItem barButtonItemWithImageName:@"backStretchBackgroundNormal"
                                                                                                title:@""
                                                                                               target:self
                                                                                               action:@selector(backViewController)];
    }
    
    [super pushViewController:viewController animated:animated];
    
}
#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--

@end
