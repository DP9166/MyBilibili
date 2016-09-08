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
@interface DPHomeViewController ()<UIScrollViewDelegate>


@property (nonatomic,strong) DPHomeTitleView *headView;
@property (nonatomic,strong) UIScrollView *scrollView;

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
    self.headView = headView;
    [self.view addSubview:headView];
    
    // 创建UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0,  DPHomeTitleNavHeight, DPScreenWidth, DPScreenHeight);
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    // 首先先创建 "推荐" 子控制器
    [self addChildController];
    // 创建 "live"直播控制器
    
    
    // 监听bodyItemsView点击
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemsViewOnClick:) name:DPHomeBodySelectedItemsViewNotification object:nil];
    
    // 监听HeadViewBtn点击
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(headBtnOnClick:) name:DPHomeHeadBodyBtnOnClickNotification object:nil];
    
}

- (void)addChildController {
    DPHomeLiveTableViewController *liveTableVC = [[DPHomeLiveTableViewController alloc] init];
    liveTableVC.view.frame = CGRectMake(0, 0, DPScreenWidth, DPScreenHeight);
    
    DPHomeRecommendTableVC *recommendTableVC = [[DPHomeRecommendTableVC alloc] init];
    recommendTableVC.view.frame = CGRectMake(DPScreenWidth, 0, DPScreenWidth, DPScreenHeight);
    
    DPHomeBangumiTableViewController *bangumiTableVC = [[DPHomeBangumiTableViewController alloc] init];
    bangumiTableVC.view.frame = CGRectMake(DPScreenWidth*2, 0, DPScreenWidth, DPScreenHeight);
    
    [self.scrollView addSubview:liveTableVC.view];
    [self.scrollView addSubview:recommendTableVC.view];
    [self.scrollView addSubview:bangumiTableVC.view];

    
    [self addChildViewController:liveTableVC];
    [self addChildViewController:recommendTableVC];
    [self addChildViewController:bangumiTableVC];
    
    
    [self.scrollView setContentSize:CGSizeMake(DPScreenWidth*3, 0)];
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    [self.scrollView setContentOffset:CGPointMake(DPScreenWidth, 0) animated:NO];
    
}


#pragma mark - UIScrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 0/320/640
    
    NSString *currentIndex = [NSString stringWithFormat:@"%f",scrollView.contentOffset.x/320];
    
    if (scrollView.contentOffset.x /320 == (int)scrollView.contentOffset.x /320) {
        self.headView.selectedIndex = currentIndex;
    }
    
}


#pragma mark - 通知
- (void)itemsViewOnClick:(NSNotification *)notification {
    DPHomeItemsController *itemsController = [[DPHomeItemsController alloc] init];    
    [self.navigationController pushViewController:itemsController animated:YES];
}

- (void)headBtnOnClick:(NSNotification *)notification {
    // 改变scrollView Contentoffset.x
    NSInteger currentId = [notification.userInfo[HeadViewBtnTag] integerValue];
    [self.scrollView setContentOffset:CGPointMake(currentId *DPScreenWidth, 0) animated:YES];
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
