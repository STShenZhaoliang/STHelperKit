//
//  UIImage+ST.h
//  STHelperKit
//
//  Created by 沈兆良 on 16/7/29.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ST)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/** 设置圆形图片(放到分类中使用) */
- (UIImage *)imageToCircleImage;
@end

NS_ASSUME_NONNULL_END
