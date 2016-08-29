//
//  DPHomeNormalView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeNormalView.h"


#import "DPHomeTitleView.h"

#import "DPHomeNormalViewFrame.h"

#import "DPHomeStatus.h"

@interface DPHomeNormalView()

@property (nonatomic,strong) DPHomeTitleView *titleView;
@property (nonatomic,strong) UIView *contentView;

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
    DPHomeTitleView *titleView = [[DPHomeTitleView alloc] init];
    self.titleView = titleView;
    
    [self addSubview:titleView];
    
    UIView *contentView = [[UIView alloc] init];
    self.contentView = contentView;
    [self addSubview:contentView];
}

- (void)setNormalFrame:(DPHomeNormalViewFrame *)normalFrame {
    
    _normalFrame = normalFrame;
    
    
    self.frame = normalFrame.frame;
    
}




@end
