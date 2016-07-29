//
//  NSString+ST.m
//  STHelperKit
//
//  Created by 沈兆良 on 16/7/29.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "NSString+ST.h"

@implementation NSString (ST)
/**
 *  1.返回字符串所占用的尺寸
 *
 *  @param fontSize     字体大小
 *  @param maxWidth     最大宽度
 *  @param maxHeight    最大高度
 */
- (CGSize)sizeWithFont:(CGFloat)fontSize
              maxWidth:(CGFloat)maxWidth
             maxHeight:(CGFloat)maxHeight
{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    return [self boundingRectWithSize:CGSizeMake(maxWidth, maxHeight)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

@end
