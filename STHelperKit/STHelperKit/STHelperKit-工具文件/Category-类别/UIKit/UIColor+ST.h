//
//  UIColor+ST.h
//  STHelperKit
//
//  Created by 沈兆良 on 16/7/29.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - UIColor

/**
 *	The following macros are system colors.
 */
#define STBlackColor       [UIColor blackColor]
#define STDarkGrayColor    [UIColor darkGrayColor]
#define STLightGrayColor   [UIColor lightGrayColor]
#define STWhiteColor       [UIColor whiteColor]
#define STRedColor         [UIColor redColor]
#define STBlueColor        [UIColor blueColor]
#define STGreenColor       [UIColor greenColor]
#define STCyanColor        [UIColor cyanColor]
#define STYellowColor      [UIColor yellowColor]
#define STMagentaColor     [UIColor magentaColor]
#define STOrangeColor      [UIColor orangeColor]
#define STPurpleColor      [UIColor purpleColor]
#define STBrownColor       [UIColor brownColor]
#define STClearColor       [UIColor clearColor]

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ST)

// Convenience methods for creating colors
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHex:(unsigned int)hex;
+ (UIColor *)colorWithHex:(unsigned int)hex alpha:(float)alpha;
+ (UIColor *)randomColor;
+ (UIColor *)colorWithColor:(UIColor *)color alpha:(float)alpha;

@end
NS_ASSUME_NONNULL_END
