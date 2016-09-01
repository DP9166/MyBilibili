//
//  DPHomeBodyBannerView.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/1.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyBannerView.h"
#import "DPHomeStatusBanner.h"
#import "DPHomeStatusBottom.h"

#import "DPHomeBodyBannerViewFrame.h"


#import "UIImageView+WebCache.h"

@interface DPHomeBodyBannerView()
@property (nonatomic,strong) UIImageView *bannerImageView;

@end

@implementation DPHomeBodyBannerView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *bannerImageView = [[UIImageView alloc] init];
        bannerImageView.backgroundColor = [UIColor greenColor];
        self.bannerImageView = bannerImageView;
        [self addSubview:bannerImageView];
    }
    return self;
}


- (void)setBannerViewFrame:(DPHomeBodyBannerViewFrame *)bannerViewFrame {
    _bannerViewFrame = bannerViewFrame;

    
    DPHomeStatusBanner *banner = bannerViewFrame.banner;
    DPHomeStatusBottom *bottom = [banner.bottom firstObject];
    
    [self.bannerImageView sd_setImageWithURL:[NSURL URLWithString:bottom.image] placeholderImage:nil];
    
    self.frame = bannerViewFrame.frame;
    self.bannerImageView.frame = bannerViewFrame.bottomViewFrame;
}

@end
