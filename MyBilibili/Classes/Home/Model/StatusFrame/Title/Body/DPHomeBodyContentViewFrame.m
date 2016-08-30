//
//  DPHomeBodyContentViewFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyContentViewFrame.h"
#import "DPHomeStatus.h"
#import "DPBodyItemsView.h"

@implementation DPHomeBodyContentViewFrame

- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    
    CGFloat itemX = DPHomeStatusMargin;
    CGFloat itemY = 0;
    CGSize itemSize = [DPBodyItemsView sizeWithItemsCount:status.body.count];
    self.itemFrame = (CGRect){{itemX,itemY},itemSize};
    
    self.frame = CGRectMake(0, 0, DPScreenWidth, CGRectGetHeight(self.itemFrame));
    
}

@end
