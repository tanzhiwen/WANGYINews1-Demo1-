//
//  TZWChannel.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/20.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWChannel.h"

@implementation TZWChannel

- (void)setTid:(NSString *)tid{
    _tid=[tid copy];
    _URLString=[NSString stringWithFormat:@"article/headline/%@/0-20.html",tid];
}


//返回新闻频道
+(NSArray *)channels{
    NSData *data=[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil]];
    NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSString *rootKey=dic.keyEnumerator.nextObject;
    
    NSArray *channels= dic[rootKey];
    
    
    NSMutableArray *arrayM=[NSMutableArray array];
    [channels enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TZWChannel *channel=[TZWChannel channelsWithDict:obj];
        [arrayM addObject:channel];
    }];
    // 这里注意一下根据tid进行排序
    
    return [arrayM sortedArrayUsingComparator:^NSComparisonResult(TZWChannel *obj1, TZWChannel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
}

+ (instancetype)channelsWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
