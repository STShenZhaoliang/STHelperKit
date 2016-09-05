//
//  CollectionDemo5Controller.m
//  STHelperKit
//
//  Created by ST on 16/9/5.
//  Copyright © 2016年 沈兆良. All rights reserved.
//


#import "CollectionDemo5Controller.h"
#import "CollectionDemo5Cell.h"
#import "CollectionDemo5FlowLayout.h"
#import "CollectionDemo5HeaderView.h"
@interface CollectionDemo5Controller ()<UICollectionViewDataSource, UICollectionViewDelegate>

/** 1.集合视图 */
@property(nonatomic, strong)UICollectionView *collectionView ;
/** 2.布局 */
@property(nonatomic, strong)CollectionDemo5FlowLayout *flowLayout;
/** 3.数据集合 */
@property(nonatomic, strong)NSMutableArray *arrayData;

@end

@implementation CollectionDemo5Controller

#pragma mark - --- 1.init 生命周期 ---
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.view setBackgroundColor:RGB(210, 210, 80)];
    [self.collectionView setBackgroundColor:RGB(234, 56, 234)];
}
#pragma mark - --- 2.delegate 视图委托 ---
#pragma mark - UICollectionView DataSource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionDemo5Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionDemo5CellId forIndexPath:indexPath];
    cell.text = self.arrayData[indexPath.item];
    return cell;
}

#pragma mark - UICollectionView Delegate Methods

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionDemo5HeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionDemo5HeaderViewId forIndexPath:indexPath];
        [headerView setImageName:@"animation_8"];
        return headerView;
    }else {
        return nil;
    }
}
#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--

- (CollectionDemo5FlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[CollectionDemo5FlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(SCREENWIDTH, 44);
        _flowLayout.headerReferenceSize = CGSizeMake(SCREENWIDTH, 240);
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CGFloat widthView = SCREENWIDTH;
        CGFloat heightView = SCREENHEIGHT - 20;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,
                                                                             20,
                                                                             widthView,
                                                                             heightView)
                                             collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CollectionDemo5Cell class] forCellWithReuseIdentifier:CollectionDemo5CellId];
        [_collectionView registerClass:[CollectionDemo5HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionDemo5HeaderViewId];
    }
    return _collectionView;
}

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = @[].mutableCopy;
        for (NSInteger number = 0; number < 20; number++) {
            [_arrayData addObject:[@(number).stringValue stringByAppendingString:@" test"]];
        }
    }
    return _arrayData;
}
@end


