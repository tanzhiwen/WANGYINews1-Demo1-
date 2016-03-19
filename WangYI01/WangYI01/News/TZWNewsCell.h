//
//  TZWNewsCell.h
//  WangYI01
//
//  Created by 檀志文 on 16/3/19.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZWNews.h"

@class TZWNews;

@interface TZWNewsCell : UITableViewCell

@property (nonatomic, strong) TZWNews *news;

//根据模型获得cell的重用标示
+(NSString *)cellIDWithNews:(TZWNews *)news;

//根据模型返回cell高度
+(CGFloat)cellHeight:(TZWNews *)news;

@end
