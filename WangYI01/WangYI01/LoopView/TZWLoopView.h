//
//  TZWLoopView.h
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    TZWTitlePositionBlowImage, //  标题在图片下面
    TZWTitlePositionAboveImage, // 标题在图片上面
} TZWTitlePosition;


@interface TZWLoopView : UIView

/**
 *  创建图片轮播器的方法
 *
 *  @param UrlStrs 图片数组
 *  @param titles  标题数组
 */

-(instancetype)initWithUrlStrs:(NSArray<NSString *>*)UrlStrs titles:(NSArray <NSString *>*)titles didSelected:(void (^)(NSInteger index))didSelected;

/**
 *  时间间隔
 */
@property (nonatomic, assign) NSInteger timerInterval;


// 标题的位置
@property (nonatomic, assign) TZWTitlePosition titlePosition;
@end
