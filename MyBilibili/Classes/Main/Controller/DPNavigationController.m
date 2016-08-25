//
//  DPNavigationController.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/24.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPNavigationController.h"

#define DPNavTitleFont 18

@interface DPNavigationController ()

@end

@implementation DPNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationBar.barTintColor = DPColor(247, 88, 135);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize {
    if (self == [DPNavigationController class]) {
        UINavigationBar *bar = [UINavigationBar appearance];
        NSDictionary *dict = @{
                               NSForegroundColorAttributeName:[UIColor whiteColor],
                               NSFontAttributeName:[UIFont systemFontOfSize:DPNavTitleFont]
                               };
        [bar setTitleTextAttributes:dict];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
