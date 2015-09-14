//
//  ViewController.m
//  ccccc
//
//  Created by yww on 15/9/11.
//  Copyright (c) 2015年 yww. All rights reserved.
//

#import "ViewController.h"
#import "MXCollectionViewCell.h"
#import "UIView+Extention.h"
#define MXWidth [UIScreen mainScreen].bounds.size.width
#define MXHeight [UIScreen mainScreen].bounds.size.height
#define MXCellHeight 250
#define MXRadius ( MXWidth * MXWidth /4 + MXHeight * MXHeight / 4 ) / MXWidth
static NSString *redentifier = @"MXCollectionViewCell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//collectionview
@property(nonatomic,strong)UICollectionView *collectionView;
//当前显示的cell的indexpath
@property(nonatomic,strong)NSArray *currentIndexPaths;
//当前现实的cell
@property(nonatomic,strong)NSMutableArray *visableCellArray;
@end

@implementation ViewController

#pragma mark -  懒加载
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc ]init];
        flowLayout.itemSize = CGSizeMake(300, 200);
        flowLayout.minimumLineSpacing = 20;
        flowLayout.minimumInteritemSpacing = 20;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
        _collectionView = [[UICollectionView alloc]
                            initWithFrame:self.view.bounds
                     collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor redColor];
    }
    return _collectionView;
}

- (NSMutableArray *)visableCellArray
{
    if (_visableCellArray == nil) {
        _visableCellArray = [NSMutableArray array];
      
    }
    return _visableCellArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加
    [self.view addSubview:self.collectionView];
    //代理
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark- Source Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UINib *nib = [UINib nibWithNibName:redentifier
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:redentifier];
    MXCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:redentifier forIndexPath:indexPath];
    [cell  setTitleTextWith:[NSString stringWithFormat:@"DD%ld",indexPath.item]];
     cell .tag = indexPath.section;

    return  cell ;
}
#pragma mark- FlowDelegate


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectItemAtIndexPath");
    NSLog(@"index.row = %lu",indexPath.row);
   
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *cellArray = [self.collectionView visibleCells];
    for (MXCollectionViewCell *visableCell in cellArray)
    {
        CGPoint center =
        [self.collectionView convertPoint:visableCell.center
                                   toView:self.view];
        if (center.y < (MXHeight / 2))
        {
            if (center.y <= (MXHeight / 6)) {
                CGFloat scaleH = 0.5 +  center.y / MXHeight;
                CGFloat scaleW = -0.5 + 3 * center.y / MXHeight;
                visableCell.transform =
                CGAffineTransformMakeScale(scaleW, scaleH);
            }else
            {
                CGFloat scaleH = 0.5 +  center.y / MXHeight;
                CGFloat scaleW = -0.5 + 3 * center.y / MXHeight;
                visableCell.transform =CGAffineTransformMakeScale(scaleW, scaleH);
            }
            
            
        }else if (center.y == (MXHeight / 2))
        {
            visableCell.transform =
            CGAffineTransformMakeScale(0.0, 0.0);
        }else
        {
            CGFloat scale = 1- (center.y - MXHeight /2) / MXHeight;
            visableCell.transform = CGAffineTransformMakeScale(scale, scale);
        }
        
    }
}



@end
