//
//  TZWChannelCell.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/20.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWChannelCell.h"
#import "TZWNewsViewController.h"

@implementation TZWChannelCell

- (void)setNewsVc:(TZWNewsViewController *)newsVc{
    _newsVc=newsVc;
    [self addSubview:newsVc.view];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.newsVc.view.frame=self.bounds;
}

@end
