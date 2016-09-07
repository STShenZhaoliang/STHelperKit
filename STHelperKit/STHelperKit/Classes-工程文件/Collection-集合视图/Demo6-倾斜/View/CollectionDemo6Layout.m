//
//  CollectionDemo6Layout.m
//  STHelperKit
//
//  Created by ST on 16/9/7.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "CollectionDemo6Layout.h"

@implementation CollectionDemo6Layout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attr in attributes ) {
        CGFloat degrees = M_PI * (-14.0f/180.0f);
        attr.transform = CGAffineTransformMakeRotation(degrees);
    }
    return attributes;
}

@end
