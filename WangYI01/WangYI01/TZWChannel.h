//
//  TZWChannel.h
//  WangYI01
//
//  Created by 檀志文 on 16/3/20.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TZWChannel : NSObject

//新闻频道的名称

@property (nonatomic, copy) NSString *tName;

//tid
@property (nonatomic, copy) NSString *tid;

//urlstring
@property (nonatomic, copy) NSString *URLString;


//返回新闻频道
+(NSArray *)channels;

+ (instancetype)channelsWithDict:(NSDictionary *)dict;

@end

