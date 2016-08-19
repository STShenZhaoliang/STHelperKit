//
//  ViewTest0Controller.m
//  STHelperKit
//
//  Created by ST on 16/8/19.
//  Copyright © 2016年 沈兆良. All rights reserved.
//
#pragma mark - --- 1.Controller 控制器 ---
#import "ViewTest0Controller.h"

#pragma mark - --- 2.View 视图 ---

#pragma mark - --- 3.Model 数据 ---

#pragma mark - --- 4.Tool 工具 ---


NS_ASSUME_NONNULL_BEGIN

@interface ViewTest0Controller ()
/** 1. */
@property(nonatomic, strong)UIImageView *imageView;
/** 2.头像 */
@property(nonatomic, strong)UIImageView *imageIcon ;
/** 3.输入框 */
@property(nonatomic, strong)STTextView *textView ;
@end

NS_ASSUME_NONNULL_END

@implementation ViewTest0Controller

#pragma mark - --- 1.init 生命周期 ---

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.view addSubview:self.imageView];
//    [self.view addSubview:self.imageIcon];
//    self.imageIcon.st_top = self.imageView.st_bottom;
    
    [self.view addSubview:self.textView];
}

#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:Image(icon_header)];
    }
    return _imageView;
}

- (UIImageView *)imageIcon
{
    if (!_imageIcon) {
        _imageIcon = [[UIImageView alloc]initWithImage:[Image(icon_header) imageToCircleImage]];
    }
    return _imageIcon;
}

- (STTextView *)textView
{
    if (!_textView) {
        _textView = [[STTextView alloc]initWithFrame:CGRectMake(0, 100, 300, 100)];
        [_textView setPlaceholder:@"this is a test textView"];
    }
    return _textView;
}
@end
