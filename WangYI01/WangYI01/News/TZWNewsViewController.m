//
//  TZWNewsViewController.m
//  WangYI01
//
//  Created by 檀志文 on 16/3/20.
//  Copyright © 2016年 ios檀志文. All rights reserved.
//

#import "TZWNewsViewController.h"
#import "TZWNews.h"
#import "TZWNewsCell.h"

@interface TZWNewsViewController ()

//所有的新闻数据
@property (nonatomic, strong) NSArray *news;

@end

@implementation TZWNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)setURLString:(NSString *)URLString{
    _URLString=URLString;
    [TZWNews loadNewsWithUrlString:URLString success:^(NSArray *news) {
        NSLog(@"news=%@",news);
        self.news=news;
        //刷新表格
        [self.tableView reloadData];
        
    } failed:^(NSError *error) {
        NSLog(@"error=%@",error);
    }];
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.news.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TZWNews *news=self.news[indexPath.row];
    NSString *ID=[TZWNewsCell cellIDWithNews:news];
    
    TZWNewsCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TZWNews *news=self.news[indexPath.row];
    return  [TZWNewsCell cellHeight:news];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}




@end
