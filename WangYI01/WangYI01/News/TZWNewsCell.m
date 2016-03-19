//
//  TZWNewsCell.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/19.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWNewsCell.h"
#import "TZWNews.h"
#import <UIImageView+WebCache.h>

@interface TZWNewsCell()

/**
 *  图片
 */
@property(nonatomic,weak) IBOutlet UIImageView *iconView;

/**
 *  标题
 */
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
/**
 *  摘要
 */
@property (nonatomic, weak) IBOutlet UILabel *digestLabel;
/**
 *  跟帖数
 */
@property (nonatomic, weak) IBOutlet UILabel *replyCountLabel;

@property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray *imgextras;



@end

@implementation TZWNewsCell

-(void)setNews:(TZWNews *)news{
    _news=news;
    self.titleLabel.text=news.title;
    self.digestLabel.text=news.digest;
    self.replyCountLabel.text=[NSString stringWithFormat:@"%zd跟贴",[news.replyCount intValue]];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    
    [news.imgextra enumerateObjectsUsingBlock:^(NSDictionary *imageDict, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView=self.imgextras[idx];
        NSString *imageSrc=imageDict[@"imgsrc"];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageSrc]];
    }];

}

/**
 *  根据模型获得cell的重用标示
 */
+(NSString *)cellIDWithNews:(TZWNews *)news{
    NSString *ID=@"news";
    if (news.imgextra) {
        ID=@"threeImagesCell";
    }else if(news.imgType){
        ID=@"bigImageCell";
    }
    return ID;
}

/**
 *  根据模型返回cell的高度
 */
+(CGFloat)cellHeight:(TZWNews *)news{
    CGFloat height=80;
    if (news.imgextra) {
        height=120;
    }else if(news.imgType){
        height=170;
    }
    return height;
}

@end

