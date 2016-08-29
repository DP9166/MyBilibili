//
//  DPHomeStatusFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeStatusFrame.h"

#import "DPHomeNormalViewFrame.h"

@implementation DPHomeStatusFrame


- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    [self setupNormalViewFrame];
    
    _cellHeight = CGRectGetMaxY(_normalViewFrame.frame);
}


- (void)setupNormalViewFrame {
    DPHomeNormalViewFrame *normalViewFrame = [[DPHomeNormalViewFrame alloc] init];
    
    normalViewFrame.status = self.status;
    self.normalViewFrame = normalViewFrame;
    
}

@end
