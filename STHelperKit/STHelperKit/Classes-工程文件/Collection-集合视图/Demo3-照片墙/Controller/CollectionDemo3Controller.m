//
//  CollectionDemo3Controller.m
//  STHelperKit
//
//  Created by ST on 16/9/1.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "CollectionDemo3Controller.h"
#import "CollectionDemo3Cell.h"
#import "STCollectionViewFlowLayout.h"
#import "CollectionDemo3HeaderView.h"

@interface CollectionDemo3Controller ()<STCollectionViewDelegateFlowLayout,UICollectionViewDataSource>

/** 1.集合视图 */
@property(nonatomic, strong)UICollectionView *collectionView ;
/** 2.布局 */
@property(nonatomic, strong)STCollectionViewFlowLayout *flowLayout;
/** 3.数据字典 */
@property(nonatomic, strong)NSMutableDictionary *dicData;
/** 4. */
@property(nonatomic, strong)NSArray<NSString *> *sortedArray ;

@end

@implementation CollectionDemo3Controller

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
    return [[self.dicData allKeys] count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.sortedArray = [[self.dicData allKeys] sortedArrayUsingSelector:@selector(compare:)];
    return [self.dicData[self.sortedArray[section]] count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(STCollectionViewFlowLayout *)layout numberOfColumnsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionDemo3Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionDemo3CellId forIndexPath:indexPath];
    NSString *imageName = self.dicData[self.sortedArray[indexPath.section]][indexPath.row];
    cell.imageName = imageName;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(kind == UICollectionElementKindSectionHeader){
        CollectionDemo3HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionDemo3HeaderViewId forIndexPath:indexPath];
        header.text = self.sortedArray[indexPath.section];
        return header;
    }else {
        return nil;
    }
}

#pragma mark - UICollectionView Delegate Methods

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.bounds.size.width, 44);
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
        _flowLayout.enableStickyHeaders = YES;
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
        [_collectionView registerClass:[CollectionDemo3Cell class] forCellWithReuseIdentifier:CollectionDemo3CellId];
        [_collectionView registerClass:[CollectionDemo3HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionDemo3HeaderViewId];
    }
    return _collectionView;
}

- (NSMutableDictionary *)dicData
{
    if (!_dicData) {
        _dicData = @{}.mutableCopy;
        for (NSInteger number = 0; number < 10; number++) {
            NSMutableArray *arrayPicture = @[].mutableCopy;
            for (NSInteger i = 0; i < 14; i++) {
                [arrayPicture addObject:[@(i).stringValue stringByAppendingString:@"_full"]];
            }
            [_dicData setObject:arrayPicture
                         forKey:[NSString stringWithFormat:@"Test 标题 %zi",number]];
        }
        
    }
    return _dicData;
}
@end
