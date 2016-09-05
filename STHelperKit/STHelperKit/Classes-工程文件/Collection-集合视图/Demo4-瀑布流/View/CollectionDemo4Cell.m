//
//  CollectionDemo4Cell.m
//  STHelperKit
//
//  Created by ST on 16/9/1.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "CollectionDemo4Cell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionDemo4Cell ()
/** 1. */
@property(nonatomic, strong)UIImageView *imageView;

@end

NS_ASSUME_NONNULL_END

@implementation CollectionDemo4Cell
#pragma mark - --- 1.init 生命周期 ---
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGB(123, 123, 156);
        self.contentView.backgroundColor = RGB(45, 123, 180);
        self.imageView.backgroundColor = RGB(34, 200, 56);
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
}
#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}

#pragma mark - --- 6.getters 属性 —--
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
@end
