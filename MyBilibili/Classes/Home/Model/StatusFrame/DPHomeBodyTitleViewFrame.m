//
//  DPHomeBodyTitleViewFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyTitleViewFrame.h"
#import "DPHomeStatus.h"


@implementation DPHomeBodyTitleViewFrame

- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    // 1. icon
    CGFloat iconX = DPHomeStatusMargin;
    CGFloat iconY = DPHomeStatusMargin;
    CGFloat iconW = 18;
    CGFloat iconH = 18;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2. title
    CGFloat titleX = CGRectGetMaxX(self.iconFrame)+5;
    CGFloat titleY = iconY;
    
    CGSize maxSize = CGSizeMake(DPScreenWidth, MAXFLOAT);
    NSDictionary *attribute =@{NSFontAttributeName: DPHomeBodyTitleFont};
    
    CGSize titleSize = [status.title boundingRectWithSize:maxSize options:                NSStringDrawingTruncatesLastVisibleLine |
                        NSStringDrawingUsesLineFragmentOrigin |
                        NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    self.titleFrame = (CGRect){{titleX,titleY},titleSize};
    
    
    
    // 4. detail
    CGFloat detailY = iconY;
    CGFloat detailW = DPTitleDetailWidth;
    CGFloat detailH = 20;
    CGFloat detailX = DPScreenWidth - DPTitleDetailWidth - DPHomeStatusMargin;
    
    DPLog(@"%f",detailX);
    self.detailFrame = CGRectMake(detailX, detailY, detailW, detailH);
    self.frame = (CGRect){{titleX,titleY},titleSize};
}

@end
