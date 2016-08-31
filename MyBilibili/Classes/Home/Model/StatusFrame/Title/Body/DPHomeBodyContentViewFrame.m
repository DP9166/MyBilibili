//
//  DPHomeBodyContentViewFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyContentViewFrame.h"
#import "DPHomeStatus.h"
#import "DPHomeBodyContentView.h"
#import "DPBodyItemsViewFrame.h"

@implementation DPHomeBodyContentViewFrame

- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    CGFloat itemX = DPHomeStatusMargin;
    CGFloat itemY = 0;
    CGSize itemSize = [DPHomeBodyContentView sizeWithItemsCount:status.body.count];
    self.frame = (CGRect){{itemX,itemY},itemSize};
    
}

@end
