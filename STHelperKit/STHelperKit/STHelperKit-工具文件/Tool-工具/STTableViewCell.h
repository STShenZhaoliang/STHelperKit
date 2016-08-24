//
//  STTableViewCell.h
//  STHelperKit
//
//  Created by ST on 16/8/24.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STTableViewCell : UITableViewCell
/**
 *  1.Cell的复用
 *
 *  @param tableView <#tableView description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)cellWithTableView:(UITableView*)tableView;

/**
 *  2.设置视图
 */
- (void)setupUI;
@end
