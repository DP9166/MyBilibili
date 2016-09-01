//
//  DPHomeNormalView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeNormalView.h"

#import "DPHomeNormalViewFrame.h"

#import "DPHomeBodyTitleView.h"
#import "DPHomeBodyContentView.h"
#import "DPHomeBodyBannerView.h"

/** 数据部分*/
#import "DPHomeStatus.h"
#import "DPHomeStatusBanner.h"

@interface DPHomeNormalView()

@property (nonatomic,strong) DPHomeBodyTitleView *titleView;
@property (nonatomic,strong) DPHomeBodyContentView *contentView;
@property (nonatomic,strong) DPHomeBodyBannerView *bannerView;

@end

@implementation DPHomeNormalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}


- (void)addSubViews {
    DPHomeBodyTitleView *titleView = [[DPHomeBodyTitleView alloc] init];
    self.titleView = titleView;
    [self addSubview:titleView];
    
    DPHomeBodyContentView *contentView = [[DPHomeBodyContentView alloc] init];
    self.contentView = contentView;
    [self addSubview:contentView];
    
    
    DPHomeBodyBannerView *bannerView = [[DPHomeBodyBannerView alloc] init];
    self.bannerView = bannerView;
    [self addSubview:bannerView];
}

- (void)setNormalFrame:(DPHomeNormalViewFrame *)normalFrame {
    _normalFrame = normalFrame;
    
    self.titleView.titleViewFrame = normalFrame.titleViewFrame;
    self.contentView.contentBody = normalFrame.contentViewFrame.status.body;
    
    
    if (normalFrame.status.banner.bottom) { // 显示banner
        self.bannerView.hidden = NO;
        
        self.bannerView.bannerViewFrame = normalFrame.bannerViewFrame;
    } else { // 隐藏
        self.bannerView.hidden = YES;
    }

    
    self.frame = normalFrame.frame;
    
}




@end
