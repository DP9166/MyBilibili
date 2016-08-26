//
//  DPMeTableViewController.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/24.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPMeViewController.h"

#import "DPMeHeaderView.h"
#import "DPMeHomeTabVC.h"

#define DPHeadViewHeight 120

@interface DPMeViewController ()


@property (nonatomic,strong) UIView *headView;
@end

@implementation DPMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = DPColor(247, 88, 135);
    
    DPMeHeaderView *headView = [[DPMeHeaderView alloc] init];
    headView.frame = CGRectMake(0, 0, DPScreenWidth, DPHeadViewHeight);
    self.headView = headView;
    [self.view addSubview:headView];
    
    
    // 创建TableView
    DPMeHomeTabVC *meTabVC = [[DPMeHomeTabVC alloc] init];
    meTabVC.tableView.frame = CGRectMake(0, CGRectGetMaxY(headView.frame), DPScreenWidth, DPScreenHeight - CGRectGetMaxY(headView.frame));
    [self.view addSubview:meTabVC.tableView];
    [self addChildViewController:meTabVC];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}


#pragma mark - 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
