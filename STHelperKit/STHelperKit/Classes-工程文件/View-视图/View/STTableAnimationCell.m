//
//  STTableAnimationCell.m
//  STHelperKit
//
//  Created by ST on 16/8/24.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "STTableAnimationCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface STTableAnimationCell ()
/** 1.图片 */
@property(nonatomic, strong)UIImageView *imageIcon ;
@end

NS_ASSUME_NONNULL_END

@implementation STTableAnimationCell

#pragma mark - --- 1.init 生命周期 ---

- (void)setupUI
{
    [super setupUI];
    [self.contentView addSubview:self.imageIcon];
}

#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
     NSLog(@"%s %@", __FUNCTION__, imageName);
    [self.imageIcon setImage:Image(imageName)];
}

#pragma mark - --- 6.getters 属性 —--
- (UIImageView *)imageIcon
{
    if (!_imageIcon) {
        _imageIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HSTTableAnimationCell)];
    }
    return _imageIcon;
}
@end
