//
//  DPHomeTableViewController.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/24.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeViewController.h"
#import "DPHomeHeadView.h"

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
    DPHomeHeadView *headView = [[DPHomeHeadView alloc] init];
    headView.frame = CGRectMake(0, 0, DPScreenWidth, 50);
    headView.titleArray = self.headTitleArray;
    [self.view addSubview:headView];

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
