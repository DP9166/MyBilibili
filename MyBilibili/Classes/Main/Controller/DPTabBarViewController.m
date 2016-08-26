//
//  DPTabBarViewController.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/24.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPTabBarViewController.h"

#warning 五个子控制器
#import "DPMeViewController.h"
#import "DPHomeTableViewController.h"
#import "DPFocusTableViewController.h"
#import "DPFoundTableViewController.h"
#import "DPSubareaViewController.h"

#import "DPNavigationController.h"



@interface DPTabBarViewController ()

@end

@implementation DPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DPHomeTableViewController *homeTabCtr = [[DPHomeTableViewController alloc] init];
    DPSubareaViewController *subareaTabCtr = [[DPSubareaViewController alloc] init];
    DPFocusTableViewController *focusTabCtr = [[DPFocusTableViewController alloc] init];
    DPFoundTableViewController *foundTabCtr = [[DPFoundTableViewController alloc] init];
    DPMeViewController *meTabCtr = [[DPMeViewController alloc] init];
    
    [self addOneChildVc:homeTabCtr imageName:@"home_home_tab" selectImageName:@"home_home_tab_s"];
    [self addOneChildVc:subareaTabCtr imageName:@"home_category_tab" selectImageName:@"home_category_tab_s"];
    [self addOneChildVc:focusTabCtr imageName:@"home_attention_tab" selectImageName:@"home_attention_tab_s"];
    [self addOneChildVc:foundTabCtr imageName:@"home_discovery_tab" selectImageName:@"home_discovery_tab_s"];
    [self addOneChildVc:meTabCtr imageName:@"home_mine_tab" selectImageName:@"home_mine_tab_s"];

    
}

- (void)addOneChildVc:(UIViewController *)childVc imageName:(NSString *)imageName selectImageName:(NSString *)selectedImageName {
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    UIImage *selectedImage =  [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVc.tabBarItem.selectedImage = selectedImage;
    
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    DPNavigationController *navCtr = [[DPNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navCtr];}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
