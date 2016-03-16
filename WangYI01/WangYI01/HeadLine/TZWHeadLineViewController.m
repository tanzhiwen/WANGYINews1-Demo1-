//
//  TZWHeadLineViewController.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/16.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWHeadLineViewController.h"
#import "TZWHeadLine.h"
#import "TZWLoopView.h"


@interface TZWHeadLineViewController ()

@end

@implementation TZWHeadLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [TZWHeadLine loadHeadLinesSuccess:^(NSArray *headLines) {
        TZWLoopView *loopView=[[TZWLoopView alloc]initWithUrlStrs:[headLines valueForKeyPath:@"imgsrc"] titles:[headLines valueForKeyPath:@"title"]];
        
        //设置frame
        
        loopView.frame=self.view.bounds;
        [self.view addSubview:loopView];
    } failed:^(NSError *error){
    }];
}

@end
