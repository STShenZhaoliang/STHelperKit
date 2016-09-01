//
//  CollectionDemo2Controller.m
//  STHelperKit
//
//  Created by ST on 16/8/31.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "CollectionDemo2Controller.h"
#import "CollectionDemo2Cell.h"


@interface CollectionDemo2Controller ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** 1.集合视图 */
@property(nonatomic, strong)UICollectionView *collectionView ;
/** 2.布局 */
@property(nonatomic, strong)UICollectionViewFlowLayout *flowLayout;
/** 3.数据集 */
@property(nonatomic, strong)NSMutableArray<NSDictionary *> *arrayData;
/** 4.定时器 */
@property(nonatomic, strong)NSTimer *timer ;
@end

@implementation CollectionDemo2Controller

#pragma mark - --- 1.init 生命周期 ---

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.view setBackgroundColor:RGB(210, 210, 80)];
    [self.collectionView setBackgroundColor:RGB(234, 56, 234)];

    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - --- 2.delegate 视图委托 ---

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return CollectionDemo2CellMaxSection;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionDemo2Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionDemo2CellId forIndexPath:indexPath];
     NSLog(@"%s %ld", __FUNCTION__, (long)indexPath.item);
    NSDictionary *dic = self.arrayData[indexPath.item];
    cell.imageName = dic[@"imageName"];
    cell.text = dic[@"text"];
    return cell;
}

#pragma mark 当用户操作界面的时候调用
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark 当用户停止的时候调用
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
     [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark 设置页码
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = (NSInteger)(scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.arrayData.count;
    NSLog(@"%s %zd", __FUNCTION__, page);
}
#pragma mark - --- 3.event response 事件相应 ---

- (void)nextPage
{
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:CollectionDemo2CellMaxSection/2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentIndexPathReset.item+1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem==self.arrayData.count) {
        nextItem=0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---

#pragma mark - --- 6.getters 属性 —--
- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat widthItem = SCREENWIDTH;
        CGFloat heightItem = widthItem * 0.75;
        _flowLayout.itemSize = CGSizeMake(widthItem, heightItem);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumLineSpacing = 0;//设置每个item之间的间距
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CGFloat widthView = SCREENWIDTH;
        CGFloat heightView = widthView * 0.75;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,
                                                                             100,
                                                                             widthView,
                                                                             heightView)
                                             collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        
        [_collectionView registerClass:[CollectionDemo2Cell class] forCellWithReuseIdentifier:CollectionDemo2CellId];
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:CollectionDemo2CellMaxSection/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    return _collectionView;
}

- (NSMutableArray<NSDictionary *> *)arrayData
{
    if (!_arrayData) {
        _arrayData = @[].mutableCopy;
        for (NSInteger number = 0; number<= 5; number++) {
            NSDictionary *dic = @{@"imageName":[NSString stringWithFormat:@"%zi_full",number],
                                  @"text":[NSString stringWithFormat:@"我是第%zi张图",number]};
            [_arrayData addObject:dic];
        }
    }
    return _arrayData;
}

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.7
                                                  target:self
                                                selector:@selector(nextPage)
                                                userInfo:nil
                                                 repeats:YES];
    }
    return _timer;
}
@end
