//
//  CollectionDemo1Controller.m
//  STHelperKit
//
//  Created by ST on 16/8/31.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "CollectionDemo1Controller.h"

#import "CollectionDemo1Cell.h"
@interface CollectionDemo1Controller ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** 1. */
@property(nonatomic, strong)UICollectionView *collectionView ;
/** 2. */
@property(nonatomic, strong)UICollectionViewFlowLayout *flowLayout;
@end

@implementation CollectionDemo1Controller

#pragma mark - --- 1.init 生命周期 ---

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.view setBackgroundColor:RGB(210, 210, 80)];
    [self.collectionView setBackgroundColor:RGB(234, 56, 234)];
}

#pragma mark - --- 2.delegate 视图委托 ---

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionDemo1Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionDemo1CellId forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"%zi_full", indexPath.row];
    cell.text = [NSString stringWithFormat:@"测试%zi节%zi个",indexPath.section,indexPath.row];
    return cell;
}

#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--
- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat widthItem = (SCREENWIDTH - 3 * STMargin) / 2;
        CGFloat heightItem = widthItem * 0.75;
        _flowLayout.itemSize = CGSizeMake(widthItem, heightItem);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.minimumLineSpacing = STMargin;//设置每个item之间的间距
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(STMargin,
                                                                             0,
                                                                             SCREENWIDTH-2*STMargin,
                                                                             SCREENHEIGHT)
                                             collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = YES;
        _collectionView.backgroundColor = [UIColor blackColor];
        [_collectionView registerClass:[CollectionDemo1Cell class] forCellWithReuseIdentifier:CollectionDemo1CellId];
    }
    return _collectionView;
}
@end
