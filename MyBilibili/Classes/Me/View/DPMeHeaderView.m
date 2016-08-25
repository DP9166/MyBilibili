//
//  DPMeHeaderView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/25.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPMeHeaderView.h"


@interface DPMeHeaderView ()
{
    UIButton *_registerBtn;
    UIButton *_loginBtn;
}

@end

@implementation DPMeHeaderView

- (instancetype)init {
    if (self == [super init]) {
        [self showView];
    }
    return self;
}

- (void)showView {
    _registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _registerBtn.backgroundColor = DPColor(255, 141, 172);
    [self addSubview:_registerBtn];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:DPColor(246, 75, 131) forState:UIControlStateNormal];
    _loginBtn.backgroundColor = [UIColor whiteColor];
    [self addSubview:_loginBtn];
    
}

- (void)layoutSubviews {
    _registerBtn = self.subviews[0];
    
    
}


@end
