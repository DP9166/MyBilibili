//
//  DPHomeNormalViewFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeNormalViewFrame.h"

#import "DPHomeStatus.h"

@implementation DPHomeNormalViewFrame

- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    
    self.frame = CGRectMake(0, 0, DPScreenWidth, 200);
}

@end
