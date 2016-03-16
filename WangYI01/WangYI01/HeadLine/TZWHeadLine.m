//
//  TZWHeadLine.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWHeadLine.h"
#import "TZWNetworkTool.h"

@implementation TZWHeadLine

+ (instancetype)headLineWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}



+(void)loadHeadLinesSuccess:(void(^)(NSArray *headLines))success failed:(void(^)(NSError *error))failed{
    NSAssert(success!=nil, @"必须传人完成回调");
    [[TZWNetworkTool shareNetworkTool]GET:@"ad/headline/0-4.html" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
       NSString *rootKey = responseObject.keyEnumerator.nextObject;
       NSArray *headLines=responseObject[rootKey];
        
        NSMutableArray *arrayM=[NSMutableArray arrayWithCapacity:headLines.count];
       [headLines enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
           TZWHeadLine *headline=[TZWHeadLine headLineWithDict:obj];
           [arrayM addObject:headline];
       }];
        /**
         *  完成回调
         */
        success(arrayM.copy);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            failed(error);
        }
    }];
}

@end
