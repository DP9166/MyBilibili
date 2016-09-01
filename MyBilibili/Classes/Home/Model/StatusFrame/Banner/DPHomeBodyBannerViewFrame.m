//
//  DPHomeBodyBannerViewFrame.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/1.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyBannerViewFrame.h"
#import "DPHomeStatusBanner.h"
@implementation DPHomeBodyBannerViewFrame

- (void)setBanner:(DPHomeStatusBanner *)banner {
    _banner = banner;
    
    // 排除掉头部情况
    if (banner.top.count) return;
    
    
    CGFloat bottomX = 0;
    CGFloat bottomY = DPHomeAloneItemWidth * 2 + 35;
    CGFloat bottomW = DPScreenWidth;
    CGFloat bottomH = 70;
    
    self.bottomViewFrame = CGRectMake(bottomX, bottomY, bottomW, bottomH);
    
    
    
    
    self.frame = CGRectMake(0, 0, DPScreenWidth, 50);
    
}


@end
