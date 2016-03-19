//
//  TZWNews.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/19.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWNews.h"
#import "TZWNetworkTool.h"



@implementation TZWNews

+ (instancetype)newsWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}


+(void)loadNewsWithUrlString:(NSString *)UrlString success:(void(^)(NSArray *))success
                      failed:(void (^)(NSError *))failed{
    [[TZWNetworkTool shareNetworkTool]GET:UrlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        NSString *rootKey=responseObject.keyEnumerator.nextObject;
        
        NSArray *news=responseObject[rootKey];
        
        NSMutableArray *arrayM=[NSMutableArray arrayWithCapacity:news.count];
        [news enumerateObjectsUsingBlock:^(NSDictionary  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            TZWNews *new=[TZWNews newsWithDict:obj];
            [arrayM addObject:new];
        }];
        success(arrayM.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            failed(error);
        }
    }];
}

@end
