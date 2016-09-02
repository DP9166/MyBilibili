//
//  DPHomeTableViewController.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/24.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeViewController.h"
#import "DPHomeTitleView.h"


#import "DPHomeRecommendTableVC.h"
#import "DPHomeLiveTableViewController.h"
#import "DPHomeBangumiTableViewController.h"


#import "DPHomeItemsController.h"

#import "DPHomeStatusBody.h"





#define DPHomeTitleNavHeight 50
@interface DPHomeViewController ()

@property (nonatomic,strong) NSArray *headTitleArray;

@end

@implementation DPHomeViewController



#pragma mark - lazy
- (NSArray *)headTitleArray
{
    if(!_headTitleArray){
        self.headTitleArray = [[NSArray alloc] init];
        
        self.headTitleArray = @[@"直播",@"推荐",@"番剧"];
    }
    return _headTitleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建头部视图
    DPHomeTitleView *headView = [[DPHomeTitleView alloc] init];
    headView.frame = CGRectMake(0, 0, DPScreenWidth, DPHomeTitleNavHeight);
    headView.titleArray = self.headTitleArray;
    [self.view addSubview:headView];
    
    
    // 创建UIScrollView
    
    
    // 首先先创建 "推荐" 子控制器
    [self addChildController];
    // 创建 "live"直播控制器
    
    
    // 监听bodyItemsView点击
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemsViewOnClick:) name:DPHomeBodySelectedItemsViewNotification object:nil];
    
}

- (void)addChildController {
    DPHomeLiveTableViewController *liveTableVC = [[DPHomeLiveTableViewController alloc] init];
    
    
    
    DPHomeRecommendTableVC *recommendTableVC = [[DPHomeRecommendTableVC alloc] init];
    recommendTableVC.view.frame = CGRectMake(0, DPHomeTitleNavHeight, DPScreenWidth, DPScreenHeight);
    
    [self.view addSubview:recommendTableVC.view];
    [self addChildViewController:recommendTableVC];
    
    
}

/** 
 * 通知
 */
- (void)itemsViewOnClick:(NSNotification *)notification {
    
    DPHomeStatusBody *body = notification.userInfo[SelectedItem];
    
    DPHomeItemsController *itemsController = [[DPHomeItemsController alloc] init];    
    [self.navigationController pushViewController:itemsController animated:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
