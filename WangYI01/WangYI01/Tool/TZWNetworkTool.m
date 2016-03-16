//
//  TZWNetworkTool.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWNetworkTool.h"

@implementation TZWNetworkTool

+(instancetype)shareNetworkTool{
    static id instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        NSURL *baseURL=[NSURL URLWithString:@"http://c.m.163.com/nc/"];
        instance=[[self alloc]initWithBaseURL:baseURL];
    });
    return instance;
}



@end
