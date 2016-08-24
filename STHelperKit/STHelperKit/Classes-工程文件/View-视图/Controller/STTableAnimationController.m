//
//  STTableAnimationController.m
//  STHelperKit
//
//  Created by ST on 16/8/24.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#pragma mark - --- 1.Controller 控制器 ---
#import "STTableAnimationController.h"

#pragma mark - --- 2.View 视图 ---
#import "STTableAnimationCell.h"

#pragma mark - --- 3.Model 数据 ---

#pragma mark - --- 4.Tool 工具 ---

@interface STTableAnimationController ()

@end

@implementation STTableAnimationController

#pragma mark - --- 1.init 生命周期 ---

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = HSTTableAnimationCell;
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:Image(@"bizhi01")];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - --- 2.delegate 视图委托 ---

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STTableAnimationCell *cell = [STTableAnimationCell cellWithTableView:tableView];
    [cell setImageName:[@"animation_" stringByAppendingString:@(indexPath.row).stringValue]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, 0, 0, 0, 1);//渐变
//  transform = CATransform3DTranslate(transform, -200, 0, 0);//左边水平移动
//  transform = CATransform3DScale(transform, 0, 0, 0);//由小变大
    
    cell.layer.transform = transform;
    cell.layer.opacity = 0.0;
    
    [UIView animateWithDuration:0.6 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.layer.opacity = 1;
    }];
}
#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--

@end
