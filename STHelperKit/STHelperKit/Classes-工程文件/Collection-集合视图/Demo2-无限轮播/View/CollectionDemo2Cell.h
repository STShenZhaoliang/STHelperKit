//
//  CollectionDemo2Cell.h
//  STHelperKit
//
//  Created by ST on 16/8/31.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *CollectionDemo2CellId = @"CollectionDemo2CellId";
static const NSInteger CollectionDemo2CellMaxSection = 4;

@interface CollectionDemo2Cell : UICollectionViewCell
/** 1. */
@property(nonatomic, strong)NSString *imageName;
/** 2. */
@property(nonatomic, strong)NSString *text;
@end
