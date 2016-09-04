//
//  DPHomeHeadView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/27.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeTitleView.h"

@interface DPHomeTitleView()
@property (nonatomic,strong) UIButton *selectedBtn;
@property (nonatomic,strong) UIImageView *selectedLineView;
@end


@implementation DPHomeTitleView

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
        btn.tag = i;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 1) {
            self.selectedBtn = btn;
        }
        [self addSubview:btn];
    }
    
    // 暂时创建一个替代品
    UIImageView *selectedLineView = [[UIImageView alloc] init];
    selectedLineView.backgroundColor = [UIColor whiteColor];
    self.selectedLineView = selectedLineView;
    [self addSubview:selectedLineView];
}


- (void)btnOnClick:(UIButton *)btn {
    
    if (btn.selected) return;
    
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
   // 通知
    NSMutableDictionary *userinfo = [NSMutableDictionary dictionary];
    userinfo[HeadViewBtnTag] = [NSString stringWithFormat:@"%ld",(long)btn.tag];
    [[NSNotificationCenter defaultCenter] postNotificationName:DPHomeHeadBodyBtnOnClickNotification object:nil userInfo:userinfo];
    
    [self changeWithBottomImageViewwithTag:btn.tag];
    
}


- (void)setSelectedIndex:(NSString *)selectedIndex {
    _selectedIndex = selectedIndex;
    
    NSInteger tag = [selectedIndex integerValue];
    [self changeWithBottomImageViewwithTag:tag];
}

- (void)changeWithBottomImageViewwithTag: (NSInteger)tag {
    // 改变下标动画
    [UIView animateWithDuration:0.2f animations:^{
        self.selectedLineView.x = (60 * tag) + 70;
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (NSUInteger i = 0; i < self.subviews.count ; i++) {
        UIButton *btn = self.subviews[i];
        btn.y = 20;
        btn.height = 30;
        btn.width = 40;
        btn.x = (60 * i) + 70;
    }
    
    UIImageView *selectedLineView = [self.subviews lastObject];
    selectedLineView.x = 130;
    selectedLineView.y = 47;
    selectedLineView.width = 40;
    selectedLineView.height = 2;
    
}

@end
