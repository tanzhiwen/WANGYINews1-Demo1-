//
//  TZWLoopViewFlowLayout.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWLoopViewFlowLayout.h"

@implementation TZWLoopViewFlowLayout


//collectionView 的大小已经确定

-(void)prepareLayout{
    [super prepareLayout];
    
    self.itemSize=self.collectionView.bounds.size;
    
    self.minimumInteritemSpacing=0;
    
    self.minimumLineSpacing=0;
    
    self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled=YES;
}

@end
