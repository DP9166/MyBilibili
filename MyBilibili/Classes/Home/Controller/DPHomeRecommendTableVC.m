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

#import "DPHomeStatus.h"

#import "AFNetworking.h"


@interface DPHomeRecommendTableVC ()

@property (nonatomic,strong) DPHomeHeadView *headView;


@property (nonatomic,strong) NSMutableArray *bodyStatus;
@end

@implementation DPHomeRecommendTableVC


#pragma mark - lazy
- (NSMutableArray *)bodyStatus
{
    if(!_bodyStatus){
        self.bodyStatus = [[NSMutableArray alloc] init];
    }
    return _bodyStatus;
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    DPLog(@"%f",self.tableView.height);
    [self addTopScrollView];
    
    [self addBodyView];
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

- (void)loadBodyData {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr GET:@"http://app.bilibili.com/x/show/old?platform=ios&device=phone&build=2310&access_key=" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        DPLog(@"%@",responseObject[@"result"]);
        self.bodyStatus = [DPHomeStatus mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
        
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

- (void)addBodyView {
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 99, 0);
    
    DPLog(@"%@",self.tabBarItem);
    
    [self loadBodyData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bodyStatus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"status";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.backgroundColor = DPRandomColor;
    return cell;
}


@end
