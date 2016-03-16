//
//  TZWNetworkTool.h
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface TZWNetworkTool : AFHTTPSessionManager

+(instancetype)shareNetworkTool;

@end
