//
//  STTableViewCell.m
//  STHelperKit
//
//  Created by ST on 16/8/24.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "STTableViewCell.h"

@implementation STTableViewCell
#pragma mark - --- 1.init 生命周期 ---
+ (instancetype)cellWithTableView:(UITableView*)tableView
{
    NSString *className = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    if (cell == nil) {
        cell = [[[super class] alloc]initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:className];
    }
    return (STTableViewCell *)cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}
#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--
@end
