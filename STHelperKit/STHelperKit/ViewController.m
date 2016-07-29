//
//  ViewController.m
//  STHelperKit
//
//  Created by 沈兆良 on 16/7/28.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "ViewController.h"

#pragma mark - --- Controller 控制器 ---

#pragma mark - --- View 视图 ---

#pragma mark - --- Model 数据 ---

#pragma mark - --- Tool 工具 ---

NS_ASSUME_NONNULL_BEGIN

@interface ViewController ()
/** 1. */
@property (nonatomic, strong) UIView *viewColor0;
/** 1. */
@property (nonatomic, strong) UIView *viewColor1;
/** 1. */
@property (nonatomic, strong) UIView *viewColor2;

@property (nonatomic, strong) UIView *viewColor3;

/** <#des#> */
@property (nonatomic, strong) UIImageView *imageView0;
/** <#des#> */
@property (nonatomic, strong) UIImageView *imageView1;
@end

NS_ASSUME_NONNULL_END

@implementation ViewController

#pragma mark - --- lift cycle 生命周期 ---
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = RGB(244, 244, 34);

    self.viewColor0 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:self.viewColor0];
    self.viewColor0.backgroundColor = [UIColor colorWithHex:0x3f3f3f alpha:0.5];

    self.viewColor1 = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 100, 100)];
    [self.view addSubview:self.viewColor1];
    self.viewColor1.backgroundColor = [UIColor colorWithHex:0x3f3f3f];

    self.viewColor2 = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    [self.view addSubview:self.viewColor2];
    self.viewColor2.backgroundColor = [UIColor randomColor];

    self.viewColor3 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.viewColor3];
    self.viewColor3.backgroundColor = [UIColor colorWithHexString:@"#450000"];


    self.imageView0 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    [self.view addSubview:self.imageView0];
    self.imageView0.image = [UIImage imageWithColor:[UIColor colorWithHex:0x5d4fff] size:CGSizeMake(100, 100)];

    self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    [self.view addSubview:self.imageView1];
    self.imageView1.image = [UIImage imageWithColor:[UIColor colorWithHex:0x5d4f00]];

    NSString* str0;

    NSLog(@"%s %@", __FUNCTION__, str0);

    NSLog(@"%s %@", __FUNCTION__, NSStringFromClass([str0 class]));
    NSLog(@"%s %s", __FUNCTION__, object_getClassName(str0));

    if ([str0 isKindOfClass:[NSNull class]]) {
        NSLog(@"%s %@", __FUNCTION__, @"0000000000000");
    }


    if (str0 == nil) {
        NSLog(@"%s %@", __FUNCTION__, @"111111111");
    }


    if (isEmptyString(str0)) {
        NSLog(@"%s %@", __FUNCTION__, @"333333333");
    }

//#define kIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))





}
#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- setters 属性 ---

#pragma mark - --- getters 属性 ---

@end
