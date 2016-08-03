//
//  STProgressHUD.h
//  STHelperKit
//
//  Created by 沈兆良 on 16/8/3.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

#define STShowText(text) [STProgressHUD showWithText:(text) AddedTo:self.view];
#define STShow           [STProgressHUD showToView:self.view];
@interface STProgressHUD : MBProgressHUD
+ (void)showWithText:(NSString *)text AddedTo:(UIView *)view;
+ (void)showToView:(UIView *)view;
+ (STProgressHUD *)sharedInstance;
@end
