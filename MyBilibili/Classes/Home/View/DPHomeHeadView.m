//
//  DPHomeHeadView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/27.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeHeadView.h"

@implementation DPHomeHeadView

- (instancetype)init {
    if (self == [super init]) {
        self.backgroundColor = DPColor(247, 88, 135);
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    
    for (NSUInteger i = 0; i <titleArray.count ; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
    
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
    // 暂时创建一个替代品
    UIImageView *selectedLineView = [[UIImageView alloc] init];
    selectedLineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:selectedLineView];
}


- (void)btnOnClick:(UIButton *)btn {
    DPLog(@"123123");
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (NSUInteger i = 0; i < self.subviews.count ; i++) {
        UIButton *btn = self.subviews[i];
        btn.y = 20;
        btn.height = 30;
        btn.width = 50;
        btn.x = (60 * i) + 70;
    }
    
    UIImageView *selectedLineView = [self.subviews lastObject];
    selectedLineView.x = 130;
    selectedLineView.y = 49;
    selectedLineView.width = 50;
    selectedLineView.height = 1;
    
}

@end
