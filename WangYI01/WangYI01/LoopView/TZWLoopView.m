//
//  TZWLoopView.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWLoopView.h"
#import "TZWLoopViewFlowLayout.h"

@interface TZWLoopView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TZWLoopView

-(instancetype)initWithUrlStrs:(NSArray<NSString *>*)UrlStrs titles:(NSArray <NSString *>*)titles{
    if (self=[super init]) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[TZWLoopViewFlowLayout alloc]init]];
    // 设置代理和数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [self addSubview:collectionView];
    self.collectionView = collectionView;

    
    
    // 创建标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = [UIColor grayColor];
    [self addSubview:self.titleLabel];
    
    // 分页指示器
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    // 如果只有一页 则隐藏分页指示器
    self.pageControl.hidesForSinglePage = YES;
    [self addSubview:self.pageControl];


}


@end
