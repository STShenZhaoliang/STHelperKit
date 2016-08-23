//
//  STBarButtonItem.m
//  STHelperKit
//
//  Created by ST on 16/8/23.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "STBarButtonItem.h"

@implementation STBarButtonItem
+ (STBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                     target:(id)target
                                     action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title
            forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor]
                 forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button sizeToFit];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    STBarButtonItem *barButtonItem = [[STBarButtonItem alloc]initWithCustomView:button];
    return barButtonItem;
}

+ (STBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName
                                         target:(id)target
                                         action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName]
            forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    STBarButtonItem *barButtonItem = [[STBarButtonItem alloc]initWithCustomView:button];
    return barButtonItem;
}

+ (STBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName
                                          title:(NSString *)title
                                         target:(id)target
                                         action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName]
            forState:UIControlStateNormal];
    [button setTitle:title
            forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor]
                 forState:UIControlStateNormal];
    [button sizeToFit];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    STBarButtonItem *barButtonItem = [[STBarButtonItem alloc]initWithCustomView:button];
    return barButtonItem;
}

+ (STBarButtonItem *)barButtonItemCenterWithImageName:(NSString *)imageName
                                                title:(NSString *)title
                                               target:(id)target
                                               action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName]
            forState:UIControlStateNormal];
    [button setTitle:title
            forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor]
                 forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button sizeToFit];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    STBarButtonItem *barButtonItem = [[STBarButtonItem alloc]initWithCustomView:button];
    return barButtonItem;
}
@end
