//
//  TZWNews.h
//  WangYI01
//
//  Created by 檀志文 on 16/3/19.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZWNews : NSObject

/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  新闻图片
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 *  跟帖数
 */
@property (nonatomic, strong) NSNumber *replyCount;
/**
 *  多张图片
 */
@property (nonatomic, strong) NSArray *imgextra;
/**
 *  是否是大图 YES:是 NO:不是
 */
@property (nonatomic, assign) BOOL imgType;

+(instancetype)newsWithDict:(NSDictionary *)dict;


+(void)loadNewsWithUrlString:(NSString *)UrlString success:(void(^)(NSArray *news))success failed:(void (^)(NSError *error))failed;


@end
