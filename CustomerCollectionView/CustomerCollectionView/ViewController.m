//
//  ViewController.m
//  CustomCollection
//
//  Created by WHC on 2017/7/31.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "ViewController.h"
#import "WHCWaterfallFlowLayout.h"
#define HOME_SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define HOME_SCREEN_WIDTH        HOME_SCREEN_SIZE.width
#define HOME_SCREEN_HEIGHT       HOME_SCREEN_SIZE.height

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WHCWaterfallFlowLayoutDelegate>
@property (nonatomic , strong)UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WHCWaterfallFlowLayout *whcLayout = [[WHCWaterfallFlowLayout alloc] init];
    whcLayout.itemSpacing = 10;
    whcLayout.lineSpacing = 10;
    whcLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    whcLayout.colCount = 2;
    whcLayout.delegate = self;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, HOME_SCREEN_WIDTH, HOME_SCREEN_HEIGHT) collectionViewLayout:whcLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    //    [_collectionView addSubview: self.tipLabel];
    [self.view addSubview:_collectionView];
    self.collectionView.alwaysBounceVertical = YES;
}
#pragma mark collectionViewDatasouce
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //    return self.viewModel.dataArray.count;
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"当前点击的是第%ld个cell",(long)indexPath.item);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    for (id imageView in cell.subviews) {
        [imageView removeFromSuperview];
    }
    //随机颜色
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    UILabel *lable = [[UILabel alloc]initWithFrame:cell.bounds];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    [cell addSubview:lable];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark WHCWaterfallFlowLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WHCWaterfallFlowLayout*)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath
{
    //这个位置可以设置cell 的宽高 例：设置第一个cell的宽高
    CGFloat W = (HOME_SCREEN_WIDTH - 10) / 2;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 100/W*width;
        }else
        {
            return (W + 50)/W*width;
        }
    }
    else
    {
        return 0;
    }
}

@end
