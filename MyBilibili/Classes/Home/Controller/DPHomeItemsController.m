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
    
    
    // 创建一个返回btn
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10, 20, 44, 44);
    [btn setImage:[UIImage imageNamed:@"videoinfo_back"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
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
