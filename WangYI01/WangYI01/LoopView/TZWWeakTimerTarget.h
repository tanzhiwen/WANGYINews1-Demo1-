//
//  TZWWeakTimerTarget.h
//  WangYI01
//
//  Created by 檀志文 on 16/3/19.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TZWWeakTimerTarget : NSObject

+(NSTimer *)scheduledTimerWithTimerInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end
