//
//  TZWLoopView.h
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZWLoopView : UIView

/**
 *  创建图片轮播器的方法
 *
 *  @param UrlStrs 图片数组
 *  @param titles  标题数组
 */

-(instancetype)initWithUrlStrs:(NSArray<NSString *>*)UrlStrs titles:(NSArray <NSString *>*)titles;




@end
