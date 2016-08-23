//
//  STBarButtonItem.h
//  STHelperKit
//
//  Created by ST on 16/8/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBarButtonItem : UIBarButtonItem
+ (STBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                     target:(id)target
                                     action:(SEL)action;

+ (STBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName
                                         target:(id)target
                                         action:(SEL)action;

+ (STBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName
                                          title:(NSString *)title
                                         target:(id)target
                                         action:(SEL)action;
+ (STBarButtonItem *)barButtonItemCenterWithImageName:(NSString *)imageName
                                                title:(NSString *)title
                                               target:(id)target
                                               action:(SEL)action;
@end
