//
//  CollectionDemo6Controller.m
//  STHelperKit
//
//  Created by ST on 16/9/5.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#pragma mark - --- 1.Controller 控制器 ---
#import "CollectionDemo6Controller.h"
#import "CollectionDemo6Cell.h"
#import "CollectionDemo6Layout.h"

#pragma mark - --- 2.View 视图 ---

#pragma mark - --- 3.Model 数据 ---

#pragma mark - --- 4.Tool 工具 ---

@interface CollectionDemo6Controller ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** 1.集合视图 */
@property(nonatomic, strong)UICollectionView *collectionView ;
/** 2.布局 */
@property(nonatomic, strong)CollectionDemo6Layout *flowLayout;
@end

@implementation CollectionDemo6Controller

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
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionDemo6Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionDemo6CellId forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"%zi_full",indexPath.row];
    return cell;
}

#pragma mark - --- 3.event response 事件相应 ---

#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--

- (CollectionDemo6Layout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[CollectionDemo6Layout alloc] init];
        _flowLayout.itemSize = CGSizeMake(SCREENWIDTH, 100);
        _flowLayout.minimumLineSpacing = 16;
//        _flowLayout.headerReferenceSize = CGSizeMake(SCREENWIDTH, 240);
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
        [_collectionView registerClass:[CollectionDemo6Cell class] forCellWithReuseIdentifier:CollectionDemo6CellId];
    }
    return _collectionView;
}

@end
