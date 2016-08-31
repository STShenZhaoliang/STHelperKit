//
//  AutorotateController.m
//  STHelperKit
//
//  Created by ST on 16/8/30.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "AutorotateController.h"
#import "PortraitController.h"
@interface AutorotateController ()
/** 1. */
@property(nonatomic, strong)UIButton *buttonPush;
/** <#content#> */
@property(nonatomic, strong)UIButton *buttonModal ;
@end

@implementation AutorotateController

#pragma mark - --- 1.init 生命周期 ---
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.buttonPush];
    [self.view addSubview:self.buttonModal];
}

#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---
- (void)ModalGoVC{
    [self presentViewController:[PortraitController new] animated:YES completion:nil];
}

- (void)pushGoVC{
    [self.navigationController pushViewController:[PortraitController new] animated:YES];
}
#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--
- (UIButton *)buttonPush
{
    if (!_buttonPush) {
        _buttonPush = [[UIButton alloc]initWithFrame:CGRectMake(20, 50, 200, 50)];
        [_buttonPush setBackgroundColor:[UIColor greenColor]];
        [_buttonPush setTitle:@"Push Controller" forState:UIControlStateNormal];
        [_buttonPush addTarget:self action:@selector(pushGoVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonPush;
}

- (UIButton *)buttonModal
{
    if (!_buttonModal) {
        _buttonModal = [[UIButton alloc]initWithFrame:CGRectMake(20, 150, 200, 50)];
        [_buttonModal setBackgroundColor:[UIColor greenColor]];
        [_buttonModal setTitle:@"Modal Controller" forState:UIControlStateNormal];
        [_buttonModal addTarget:self action:@selector(ModalGoVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonModal;
}
@end
