//
//  DPMeHeaderView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/25.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPMeHeaderView.h"
#import "DPMeHeadButton.h"

@interface DPMeHeaderView ()
{
    DPMeHeadButton *_registerBtn;
    DPMeHeadButton *_loginBtn;
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
    _registerBtn = [DPMeHeadButton buttonWithType:UIButtonTypeSystem];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _registerBtn.backgroundColor = DPColor(255, 141, 172);
    [self addSubview:_registerBtn];
    
    _loginBtn = [DPMeHeadButton buttonWithType:UIButtonTypeSystem];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:DPColor(246, 75, 131) forState:UIControlStateNormal];
    _loginBtn.backgroundColor = [UIColor whiteColor];
    [self addSubview:_loginBtn];
    
}

- (void)layoutSubviews {
     [super layoutSubviews];
    
    _registerBtn = self.subviews[0];
    
    DPMeHeadButton *registerBtn = [self.subviews firstObject];
    registerBtn.x = self.width * 0.15;
    registerBtn.y = self.height * 0.5;
    registerBtn.width = 100;
    registerBtn.height = registerBtn.width * 0.37;
    
    
    DPMeHeadButton *loginBtn = [self.subviews lastObject];
    loginBtn.width = registerBtn.width;
    loginBtn.height = registerBtn.height;
    loginBtn.y = registerBtn.y;
    loginBtn.x = CGRectGetMaxX(registerBtn.frame) + 20;
    
}


@end
