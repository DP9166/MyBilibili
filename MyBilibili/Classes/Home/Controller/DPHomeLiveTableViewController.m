//
//  DPHomeLiveViewController.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/2.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeLiveTableViewController.h"

#import "AFNetworking.h"

#import "DPLiveStatus.h"
#import "DPLivePartitions.h"
#import "DPLiveBanner.h"


#import "DPHomeLiveCell.h"
#import "DPLiveHeadView.h"

/** 
 * 先单独做出这个部分
 */

@interface DPHomeLiveTableViewController()

@property (nonatomic,strong) NSMutableArray *partitionsStatus;
@property (nonatomic,strong) DPLiveStatus *liveStatus;

@property (nonatomic,strong) DPLiveHeadView *liveHeadView;

@end

@implementation DPHomeLiveTableViewController


#pragma mark - lazy
- (NSMutableArray *)partitionsStatus
{
    if(!_partitionsStatus){
        self.partitionsStatus = [[NSMutableArray alloc] init];
    }
    return _partitionsStatus;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
     // loadData
    
    // 创建headView
    
    DPLiveHeadView *liveHeadView = [[DPLiveHeadView alloc] init];
    liveHeadView.frame = CGRectMake(0, 0, DPScreenWidth, 300);
    self.liveHeadView = liveHeadView;
    self.tableView.tableHeaderView = liveHeadView;
    [self loadData];
}

- (void)loadData {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr GET:@"http://live.bilibili.com/AppIndex/home?access_key=eb38b528c25165c1080acb302309b541&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&platform=ios&scale=2&sign=5745bea029ff01e7b3b9e463b6b7b851&ts=1473162004" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.liveStatus = [DPLiveStatus mj_objectWithKeyValues:responseObject[@"data"]];
        
        self.liveHeadView.bannerArr = self.liveStatus.banner;
        self.liveHeadView.entranceIconsArr = self.liveStatus.entranceIcons;
        [self.partitionsStatus addObjectsFromArray:self.liveStatus.partitions];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DPLog(@"%@",error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.partitionsStatus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DPHomeLiveCell *cell = [DPHomeLiveCell cellWithTableView:tableView];
    
    if (self.partitionsStatus.count>0) {
        cell.partitions = self.partitionsStatus[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}



@end
