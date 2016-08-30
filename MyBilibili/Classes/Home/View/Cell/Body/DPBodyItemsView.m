//
//  DPBodyItemsView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPBodyItemsView.h"

@implementation DPBodyItemsView

- (void)setBodyItems:(NSArray *)bodyItems {
    _bodyItems = bodyItems;
    
    
}


+ (CGSize)sizeWithItemsCount:(NSInteger)itemsCount {
    NSInteger col = itemsCount /2;
    
    CGFloat itemsW = (DPScreenWidth - (3 * DPHomeStatusMargin)) * 0.5 ;
    CGFloat itemsH = itemsW * 0.8 * col;
    
    return CGSizeMake(itemsW, itemsH);
}

@end
