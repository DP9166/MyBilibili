//
//  DPHomeNormalView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeNormalView.h"

#import "DPHomeNormalViewFrame.h"

/** title部分*/
#import "DPHomeBodyTitleView.h"
/** body部分*/
#import "DPHomeBodyContentView.h"
/** 数据部分*/
#import "DPHomeStatus.h"

@interface DPHomeNormalView()

@property (nonatomic,strong) DPHomeBodyTitleView *titleView;
@property (nonatomic,strong) DPHomeBodyContentView *contentView;

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
}

- (void)setNormalFrame:(DPHomeNormalViewFrame *)normalFrame {
    _normalFrame = normalFrame;
    
    self.titleView.titleViewFrame = normalFrame.titleViewFrame;
    self.contentView.contentBody = normalFrame.contentViewFrame.status.body;
    
    self.frame = normalFrame.frame;
    
}




@end
