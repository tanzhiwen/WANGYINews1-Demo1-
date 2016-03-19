//
//  TZWWeakTimerTarget.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/19.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWWeakTimerTarget.h"

@interface TZWWeakTimerTarget()

@property (nonatomic, strong) id aTarget;

@property (nonatomic, assign) SEL aSelector;

@end

@implementation TZWWeakTimerTarget


+(NSTimer *)scheduledTimerWithTimerInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    
    TZWWeakTimerTarget *target=[[TZWWeakTimerTarget alloc]init];
//    记录真实回调的target
    target.aTarget=aTarget;
    target.aSelector=aSelector;
    return  [NSTimer scheduledTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:nil repeats:yesOrNo];
}

-(void)update:(NSTimer *)timer{
//    回调控制器的update方法
    [self.aTarget performSelector:self.aSelector withObject:timer];
}


@end
