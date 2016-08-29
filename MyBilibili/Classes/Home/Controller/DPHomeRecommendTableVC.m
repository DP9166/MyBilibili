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
#import "DPHomeBodyTableCell.h"

#import "DPHomeStatus.h"

#import "DPHomeStatusFrame.h"

#import "AFNetworking.h"


@interface DPHomeRecommendTableVC ()

@property (nonatomic,strong) DPHomeHeadView *headView;

@property (nonatomic,strong) NSMutableArray *statusFrame;
@end

@implementation DPHomeRecommendTableVC


#pragma mark - lazy
- (NSMutableArray *)statusFrame
{
    if(!_statusFrame){
        self.statusFrame = [[NSMutableArray alloc] init];
    }
    return _statusFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
        
        self.statusFrame = [self statusFramesWithStatuses:[DPHomeStatus mj_objectArrayWithKeyValuesArray:responseObject[@"result"]]];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DPLog(@"%@",error);
    }];
}

- (NSMutableArray *)statusFramesWithStatuses:(NSArray *)statuses
{
    NSMutableArray *frames = [NSMutableArray array];
    for (DPHomeStatus *status in statuses) {
        DPHomeStatusFrame *frame = [[DPHomeStatusFrame alloc] init];
        // 传递微博模型数据，计算所有子控件的frame
        frame.status = status;
        [frames addObject:frame];
    }
    return frames;
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
    
    [self loadBodyData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DPHomeBodyTableCell *cell = [DPHomeBodyTableCell cellWithTableView:tableView];
    cell.statusFrame = self.statusFrame[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DPHomeStatusFrame *frame = self.statusFrame[indexPath.row];
    return frame.cellHeight;
}

@end
