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
#import "TZWWeakTimerTarget.h"

@interface TZWLoopView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *urlStrs;

@property (nonatomic, strong) NSArray *titles;

// 定时器
@property (nonatomic, strong) NSTimer *timer;

// 选中回调block
@property (nonatomic, copy) void (^didSelected)(NSInteger index);

@end

@implementation TZWLoopView



-(instancetype)initWithUrlStrs:(NSArray<NSString *>*)UrlStrs titles:(NSArray <NSString *>*)titles didSelected:(void (^)(NSInteger index))didSelected{   
    if (self=[super init]) {
        self.urlStrs=UrlStrs;
        self.titles=titles;
        self.didSelected=didSelected;
        self.pageControl.numberOfPages=UrlStrs.count;
        self.titleLabel.text=titles[0];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.urlStrs.count>1) {
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:UrlStrs.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//                添加定时器
                [self addTimer];
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
    // 设置默认时间 默认值2
    self.timerInterval = 2;


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



//计算页号
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page=scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    if (page==0||page==([self.collectionView numberOfItemsInSection:0]-1)) {
        page=self.urlStrs.count-((page==0)?0:1);
        self.collectionView.contentOffset=CGPointMake(page*scrollView.bounds.size.width, 0);
        
    }
//    设置标题
//    NSLog(@"%d",self.titles.count);
    
    self.titleLabel.text=self.titles[page % self.titles.count];
    self.pageControl.currentPage=page%self.urlStrs.count;
}

/**
 *  当用户开始拖拽时调用
 */

/**
 *  创建定时器
 */
-(void)addTimer {
    self.timer=[TZWWeakTimerTarget scheduledTimerWithTimerInterval:self.timerInterval target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
                   
    /**
     *  定时器回调方法
     */
- (void)nextImage {
// 获得当前显示的页号
NSInteger page = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
// 计算偏移量
CGFloat offsetX = (page + 1) * self.collectionView.bounds.size.width;
// 设置偏移量
[self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
                   
                   
/**
 *  移除定时器
 */
- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

/**
 *  当用户结束拖拽时调用
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self addTimer];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}


@end
