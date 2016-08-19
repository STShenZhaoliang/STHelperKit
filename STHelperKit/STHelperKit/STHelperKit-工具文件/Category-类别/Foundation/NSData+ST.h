//
//  NSData+ST.h
//  STHelperKit
//
//  Created by ST on 16/8/19.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ST)
//通过图片Data数据第一个字节 来获取图片扩展名
- (NSString *)contentTypeForImageData;
@end
