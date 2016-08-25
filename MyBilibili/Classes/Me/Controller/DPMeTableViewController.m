//
//  DPMeTableViewController.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/24.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPMeTableViewController.h"

#import "DPMeHeaderView.h"

#define DPHeadViewHeight 180

@interface DPMeTableViewController ()


@property (nonatomic,strong) UIView *headView;
@end

@implementation DPMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DPMeHeaderView *headView = [[DPMeHeaderView alloc] init];
    headView.frame = CGRectMake(0, -DPHeadViewHeight-20, DPScreenWidth, DPHeadViewHeight);
    self.headView = headView;
    [self.view addSubview:headView];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.showsVerticalScrollIndicator = YES;
    [self.tableView setContentInset:UIEdgeInsetsMake(CGRectGetHeight(headView.frame), 0, 0, 0)];
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
