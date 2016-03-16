//
//  TZWHeadLine.h
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TZWHeadLine : NSObject
/**
 *  图片
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

+(instancetype)headLineWithDict:(NSDictionary *)dict;

+(void)loadHeadLinesSuccess:(void(^)(NSArray *headLines))success failed:(void(^)(NSError *error))failed;



@end
