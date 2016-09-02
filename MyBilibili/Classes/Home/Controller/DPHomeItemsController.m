//
//  DPHomeItemsController.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/1.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeItemsController.h"
#import "AFNetworking.h"

@implementation DPHomeItemsController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor grayColor];

    [self loadData];
}

- (void)loadData {
    //
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr GET:@"http://app.bilibili.com/x/v2/view?access_key=eb38b528c25165c1080acb302309b541&actionKey=appkey&aid=6079129&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&plat=0&platform=ios&sign=822b2707871b54c5afc30bfe617b8166&ts=1472741176" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DPLog(@"%@",responseObject[@"data"]);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DPLog(@"%@",error);
    }];
    
    
}

@end
