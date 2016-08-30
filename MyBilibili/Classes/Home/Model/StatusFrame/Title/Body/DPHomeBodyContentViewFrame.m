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
#import "DPBodyItemsViewFrame.h"

@implementation DPHomeBodyContentViewFrame

- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    
    
    DPBodyItemsViewFrame *itemFrame = [[DPBodyItemsViewFrame alloc] init];
    itemFrame.status = status;
    self.itemFrame = itemFrame;

    
    self.frame = CGRectMake(0, 0, DPScreenWidth, CGRectGetHeight(self.itemFrame.frame));
    
}

@end
