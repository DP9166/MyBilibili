//
//  DPHeadScrollView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/28.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeHeadScrollView.h"

#import "DPHomeBanner.h"

#import "UIImageView+WebCache.h"

@implementation DPHomeHeadScrollView


- (instancetype)init {
    if (self == [super init]) {
        self.pagingEnabled = YES;
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
    
}


- (void)setBannerArray:(NSMutableArray *)bannerArray {
    _bannerArray = bannerArray;
    
    self.contentSize = CGSizeMake(DPScreenWidth *bannerArray.count, 100);
    
    for (NSUInteger i = 0; i < bannerArray.count ; i++) {
        DPHomeBanner *banner = bannerArray[i];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:banner.imageurl] placeholderImage:nil];
        
    
        [self addSubview:imageView];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (NSUInteger i = 0; i < self.subviews.count ; i++) {
        UIImageView *imageView = self.subviews[i];
        
        imageView.width = DPScreenWidth;
        imageView.height = 100;
        imageView.y = 0;
        imageView.x = i * DPScreenWidth;
    }
    
    
}
@end
