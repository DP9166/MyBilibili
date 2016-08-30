//
//  DPHomeNormalViewFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeNormalViewFrame.h"

#import "DPHomeStatus.h"
#import "DPHomeBodyTitleViewFrame.h"
#import "DPHomeBodyContentViewFrame.h"

@implementation DPHomeNormalViewFrame

- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    
    // 1. 计算titleView 的 frame
    DPHomeBodyTitleViewFrame *titleViewFrame = [[DPHomeBodyTitleViewFrame alloc] init];
    titleViewFrame.status = status;
    self.titleViewFrame = titleViewFrame;
    
    // 2. DPHomeBodyContentViewFrame
    DPHomeBodyContentViewFrame *contentViewFrame = [[DPHomeBodyContentViewFrame alloc] init];
    contentViewFrame.status = status;
    self.contentViewFrame = contentViewFrame;
    
#pragma mark - 高度需要修改
    self.frame = CGRectMake(0, 0, DPScreenWidth,CGRectGetHeight(contentViewFrame.frame));
}

@end
