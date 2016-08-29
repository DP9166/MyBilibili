//
//  DPHomeBodyTitleViewFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyTitleViewFrame.h"
#import "DPHomeStatus.h"

#define DPHomeStatusMargin 10;

@implementation DPHomeBodyTitleViewFrame

- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    // 1. icon
    CGFloat iconX = DPHomeStatusMargin;
    CGFloat iconY = 0;
    CGFloat iconW = 20;
    CGFloat iconH = 20;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2. title
    CGFloat titleX = CGRectGetMaxX(self.iconFrame)+5;
    CGFloat titleY = 0;
    
    CGSize maxSize = CGSizeMake(DPScreenWidth, MAXFLOAT);
    NSDictionary *attribute =@{NSFontAttributeName: DPHomeBodyTitleFont};
    
    CGSize titleSize = [status.title boundingRectWithSize:maxSize options:                NSStringDrawingTruncatesLastVisibleLine |
                        NSStringDrawingUsesLineFragmentOrigin |
                        NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    self.titleFrame = (CGRect){{titleX,titleY},titleSize};
    
    self.frame = (CGRect){{titleX,titleY},titleSize};
}

@end
