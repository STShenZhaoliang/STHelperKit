//
//  CollectionDemo5Cell.m
//  STHelperKit
//
//  Created by ST on 16/9/5.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "CollectionDemo5Cell.h"


NS_ASSUME_NONNULL_BEGIN

@interface CollectionDemo5Cell()
/** 1. */
@property(nonatomic, strong)UILabel *labelText ;
@end

NS_ASSUME_NONNULL_END

@implementation CollectionDemo5Cell
#pragma mark - --- 1.init 生命周期 ---
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGB(123, 123, 156);
        self.contentView.backgroundColor = RGB(45, 123, 180);
        self.labelText.backgroundColor = RGBA(100, 123, 104, 0.3);
        self.labelText.frame = self.contentView.bounds;
        [self.contentView addSubview:self.labelText];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

- (void)setText:(NSString *)text
{
    _text = text;
    self.labelText.text = text;
}
#pragma mark - --- 6.getters 属性 —--


- (UILabel *)labelText
{
    if (!_labelText) {
        _labelText = [[UILabel alloc]init];
        _labelText.font = [UIFont systemFontOfSize:15];
        _labelText.textColor = [UIColor whiteColor];
        _labelText.textAlignment = NSTextAlignmentCenter;
    }
    return _labelText;
}
@end

