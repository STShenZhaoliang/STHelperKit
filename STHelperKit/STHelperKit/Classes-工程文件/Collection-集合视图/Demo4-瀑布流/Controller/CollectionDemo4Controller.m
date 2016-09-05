//
//  CollectionDemo4Controller.m
//  STHelperKit
//
//  Created by ST on 16/9/1.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "CollectionDemo4Controller.h"
#import "CollectionDemo4Cell.h"
#import "STCollectionViewFlowLayout.h"
@interface CollectionDemo4Controller ()<STCollectionViewDelegateFlowLayout,UICollectionViewDataSource, UICollectionViewDelegate>

/** 1.集合视图 */
@property(nonatomic, strong)UICollectionView *collectionView ;
/** 2.布局 */
@property(nonatomic, strong)STCollectionViewFlowLayout *flowLayout;

/** 3.数据集合 */
@property(nonatomic, strong)NSMutableArray *arrayData;
/** 4.高度集合*/
@property(nonatomic, strong)NSMutableArray *arrayHeight;

@end

@implementation CollectionDemo4Controller

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

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(STCollectionViewFlowLayout *)layout numberOfColumnsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionDemo4Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionDemo4CellId forIndexPath:indexPath];
    cell.imageName = self.arrayData[indexPath.item];
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, [self.arrayHeight[indexPath.item] floatValue]);
}

#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--

- (STCollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[STCollectionViewFlowLayout alloc] init];
        _flowLayout.delegate = self;
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
        [_collectionView registerClass:[CollectionDemo4Cell class] forCellWithReuseIdentifier:CollectionDemo4CellId];
    }
    return _collectionView;
}

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = @[].mutableCopy;
        for (NSInteger number = 0; number < 20; number++) {
            [_arrayData addObject:[@(number).stringValue
                                   stringByAppendingString:@"_full"]];
        }
    }
    return _arrayData;
}

- (NSMutableArray *)arrayHeight
{
    if (!_arrayHeight) {
        _arrayHeight = @[].mutableCopy;
        for (NSInteger number = 0; number < 20; number++) {
            CGFloat height = 100 + (arc4random()%100);
            [_arrayHeight addObject:[NSString stringWithFormat:@"%f",height]];
        }
    }
    return _arrayHeight;
}
@end

