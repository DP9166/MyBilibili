//
//  DPBodyItemsViewFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPBodyItemsViewFrame.h"
#import "DPHomeStatus.h"

#import "DPBodyItemsView.h"

@implementation DPBodyItemsViewFrame



- (void)setStatus:(DPHomeStatus *)status {
    
    
    _status = status;
    
    CGFloat itemX = DPHomeStatusMargin;
    CGFloat itemY = 0;
    CGSize itemSize = [DPBodyItemsView sizeWithItemsCount:status.body.count];
    self.frame = (CGRect){{itemX,itemY},itemSize};
}

@end
