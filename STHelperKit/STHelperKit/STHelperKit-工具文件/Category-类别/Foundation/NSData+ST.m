//
//  NSData+ST.m
//  STHelperKit
//
//  Created by ST on 16/8/19.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "NSData+ST.h"

@implementation NSData (ST)
//通过图片Data数据第一个字节 来获取图片扩展名
- (NSString *)contentTypeForImageData{
    uint8_t c;
    [self getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([self length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[self subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}
@end
