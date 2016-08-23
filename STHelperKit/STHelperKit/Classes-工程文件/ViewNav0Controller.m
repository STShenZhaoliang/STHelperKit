//
//  ViewNav0Controller.m
//  STHelperKit
//
//  Created by ST on 16/8/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#pragma mark - --- 1.Controller 控制器 ---
#import "ViewNav0Controller.h"
#import "ViewNav1Controller.h"

#pragma mark - --- 2.View 视图 ---

#pragma mark - --- 3.Model 数据 ---

#pragma mark - --- 4.Tool 工具 ---

@interface ViewNav0Controller ()
/** 1.gotoButton */
@property(nonatomic, strong)UIButton *buttonGoto ;
@end

@implementation ViewNav0Controller

#pragma mark - --- 1.init 生命周期 ---

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.buttonGoto];
}
#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---
- (void)gotoVC
{
    [self.navigationController pushViewController:[ViewNav1Controller new] animated:YES];
}

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--
- (UIButton *)buttonGoto
{
    if (!_buttonGoto) {
        _buttonGoto = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        [_buttonGoto setBackgroundColor:[UIColor redColor]];
        [_buttonGoto addTarget:self action:@selector(gotoVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonGoto;
}

@end
