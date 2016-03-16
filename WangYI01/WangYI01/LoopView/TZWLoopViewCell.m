//
//  TZWLoopViewCell.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWLoopViewCell.h"
#import <UIImageView+WebCache.h>

@interface TZWLoopViewCell()
@property (nonatomic, strong)  UIImageView *iconView;
@end

@implementation TZWLoopViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.iconView=[[UIImageView alloc]init];
        [self addSubview:self.iconView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.iconView.frame=self.bounds;
}

- (void)setUrlString:(NSString *)urlString{
    _urlString=urlString;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:urlString]];
}

@end
