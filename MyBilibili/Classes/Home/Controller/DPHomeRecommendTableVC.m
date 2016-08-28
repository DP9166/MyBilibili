//
//  DPHomerecommendTableVC.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/27.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeRecommendTableVC.h"

#import "DPHomeBanner.h"
#import "DPHomeHeadView.h"

#import "AFNetworking.h"


@interface DPHomeRecommendTableVC ()

@property (nonatomic,strong) DPHomeHeadView *headView;
@end

@implementation DPHomeRecommendTableVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addTopScrollView];
    
}


- (void)loadHeadViewData {
    // 1. 请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr GET:@"http://app.bilibili.com/x/banner/old?screen=@2x.phone" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.headView.bannerArray  = [DPHomeBanner mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DPLog(@"%@",error);
    }];
}

- (void)addTopScrollView {
    DPHomeHeadView *headView = [[DPHomeHeadView alloc] init];
    headView.frame = CGRectMake(0, 0, DPScreenWidth, 100);
    
    self.tableView.tableHeaderView = headView;
    self.headView = headView;
    [self loadHeadViewData];
}





@end
