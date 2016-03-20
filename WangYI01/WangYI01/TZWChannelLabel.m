//
//  TZWChannelLabel.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/20.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWChannelLabel.h"

@implementation TZWChannelLabel

#define TZWSelectedFont [UIFont systemFontOfSize:18]
#define TZWNormalFont [UIFont systemFontOfSize:14]

+(instancetype)labelWithTitle:(NSString *)title{
    
    TZWChannelLabel *channelLabel=[[self alloc]init];
    channelLabel.text=title;
    channelLabel.font=TZWSelectedFont;
    [channelLabel sizeToFit];
    
    channelLabel.textAlignment=NSTextAlignmentCenter;
    channelLabel.font=TZWNormalFont;
    
    return channelLabel;
}


@end
