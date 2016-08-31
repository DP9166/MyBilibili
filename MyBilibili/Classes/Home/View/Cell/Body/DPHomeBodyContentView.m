//
//  DPHomeBodyContentView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyContentView.h"
#import "DPHomeBodyContentViewFrame.h"

/** 数据*/
#import "DPHomeStatus.h"
/** 子视图*/
#import "DPBodyItemsView.h"

@interface DPHomeBodyContentView()


@property (nonatomic,strong) DPBodyItemsView *bodyItemsView;

@property (nonatomic,strong) UIView *testView;
@end

@implementation DPHomeBodyContentView


- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        DPBodyItemsView *bodyItemsView = [[DPBodyItemsView alloc] init];
        self.bodyItemsView = bodyItemsView;
        [self addSubview:bodyItemsView];
        
        
        UIView *testView = [[UIView alloc] init];
        testView.backgroundColor = [UIColor redColor];
        self.testView = testView;
        [self addSubview:testView];
    }
    return self;
}

- (void)setContentViewFrame:(DPHomeBodyContentViewFrame *)contentViewFrame {
    _contentViewFrame = contentViewFrame;
    
    // 1. 先查看数据
    self.bodyItemsView.bodyItems = contentViewFrame.status.body;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    

    self.testView.x = 0;
    self.testView.y = 0;
    self.testView.width = 100;
    self.testView.height = 100;
    
    DPLog(@"%f",self.testView.frame.size.width);

}


@end
