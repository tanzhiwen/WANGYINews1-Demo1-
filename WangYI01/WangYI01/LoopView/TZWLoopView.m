//
//  TZWLoopView.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWLoopView.h"
#import "TZWLoopViewFlowLayout.h"
#import "TZWLoopViewCell.h"

@interface TZWLoopView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *urlStrs;

@property (nonatomic, strong) NSArray *titles;

@end

@implementation TZWLoopView

-(instancetype)initWithUrlStrs:(NSArray<NSString *>*)UrlStrs titles:(NSArray <NSString *>*)titles{
    if (self=[super init]) {
        self.urlStrs=UrlStrs;
        self.titles=titles;
        
//        设置页数
        self.pageControl.numberOfPages=UrlStrs.count;
        self.titleLabel.text=self.titles[0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.urlStrs.count>1) {
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:UrlStrs.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
            }
        });
        
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
    [collectionView registerClass:[TZWLoopViewCell class] forCellWithReuseIdentifier:@"loopCell"];
    
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

- (void)layoutSubviews{
    [super layoutSubviews];
    // 设置标题的高度
    CGFloat titleH = 30;
    // 设置collectionView的frame
    CGRect frame = self.bounds;
    frame.size.height -= titleH;
    self.collectionView.frame = frame;
     // 设置pageControl frame
    CGFloat marginX=30;
    CGFloat pageY= self.bounds.size.height-titleH;
    CGFloat pageW=self.urlStrs.count*15;
    CGFloat pageH=titleH;
    CGFloat pageX=self.bounds.size.width-pageW-marginX;
    self.pageControl.frame=CGRectMake(pageX, pageY, pageW, pageH);
    // 设置标题的frame
    CGFloat titleW=self.bounds.size.width-3*marginX-pageW;
    self.titleLabel.frame=CGRectMake(marginX, pageY, titleW, titleH);
}

#pragma mark - 数据源方法


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.urlStrs.count *((self.urlStrs.count==1)?1:100);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TZWLoopViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"loopCell" forIndexPath:indexPath];
    cell.urlString=self.urlStrs[indexPath.item%self.urlStrs.count];
    return cell;
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page=scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    if (page==0||page==([self.collectionView numberOfItemsInSection:0]-1)) {
        page=self.urlStrs.count;
    }
    self.collectionView.contentOffset=CGPointMake(page*scrollView.bounds.size.width, 0);
    
    self.titleLabel.text=self.titles[page%self.titles.count];
    self.pageControl.currentPage=page%self.urlStrs.count;
}


@end
