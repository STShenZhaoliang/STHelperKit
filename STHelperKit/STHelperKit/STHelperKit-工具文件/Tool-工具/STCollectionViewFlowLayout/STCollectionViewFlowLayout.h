//
//  STCollectionViewFlowLayout.h
//  STCollectionViewFlowLayout
//
//  Created by ST on 16/8/31.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  STCollectionViewFlowLayout;

@protocol STCollectionViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>

@required
/**
 *  The delegate method set the collectionView will flow layout as the number columns in each section.
 *
 *  @param collectionView The effect collectionView
 *  @param layout         The STCollectionViewFlowLayout inilization object.
 *  @param section        The section index
 *
 *  @return The number of columns in each section.
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView
                     layout:(STCollectionViewFlowLayout *)layout
   numberOfColumnsInSection:(NSInteger)section;

@end

@interface STCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) IBOutlet id<STCollectionViewDelegateFlowLayout> delegate;
/**
 *  Defalut is NO, set it's YES the collectionView's header will sticky on the section top.
 */
@property (nonatomic) IBInspectable BOOL enableStickyHeaders;

@end
