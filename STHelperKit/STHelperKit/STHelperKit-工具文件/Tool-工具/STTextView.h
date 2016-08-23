//
//  STTextView.h
//  STHelperKit
//
//  Created by ST on 16/8/19.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface STTextView : UITextView
/** 占位文字 */
@property (nonatomic, copy)NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong)UIColor *placeholderColor;
@end
NS_ASSUME_NONNULL_END
