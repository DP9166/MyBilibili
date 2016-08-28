//
//  DPHeadScrollView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/28.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeHeadView.h"

#import "DPHomeBanner.h"

#import "UIImageView+WebCache.h"

@interface DPHomeHeadView()

@property (nonatomic,strong) UIScrollView *srcollView;

@end

@implementation DPHomeHeadView


- (instancetype)init {
    if (self == [super init]) {
        [self createScrollView];
    }
    return self;
}

// 创建一个UIScrollView
- (void)createScrollView {
    UIScrollView *srcollView = [[UIScrollView alloc] init];
    
    srcollView.pagingEnabled = YES;
    srcollView.showsVerticalScrollIndicator = NO;
    srcollView.showsHorizontalScrollIndicator = NO;
    self.srcollView = srcollView;
    [self addSubview:srcollView];
}

- (void)setBannerArray:(NSMutableArray *)bannerArray {
    _bannerArray = bannerArray;
    
    // 设置滚动
    self.srcollView.contentSize = CGSizeMake(DPScreenWidth *bannerArray.count, 100);
    
    // 图片
    for (NSUInteger i = 0; i < bannerArray.count ; i++) {
        DPHomeBanner *banner = bannerArray[i];
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:banner.imageurl] placeholderImage:nil];
        [self.srcollView addSubview:imageView];
    }
    
    // 小白圈
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = bannerArray.count;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = DPColor(247, 88, 135);
    pageControl.defersCurrentPageDisplay = YES;
    [self addSubview:pageControl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // srcollView的Frame
    UIScrollView *srcollView = [self.subviews firstObject];
    srcollView.x = 0;
    srcollView.y = 0;
    srcollView.width = DPScreenWidth;
    srcollView.height = 100;
    
    // 图片的Frame
    for (NSUInteger i = 0; i < self.srcollView.subviews.count ; i++) {
        UIImageView *imageView = self.srcollView.subviews[i];
        
        imageView.width = DPScreenWidth;
        imageView.height = 100;
        imageView.y = 0;
        imageView.x = i * DPScreenWidth;
    }
    
    // pageControl的尺寸
    UIPageControl *pageControl = [self.subviews lastObject];
    pageControl.width = 60;
    pageControl.height = 20;
    pageControl.x = srcollView.width - pageControl.width;
    pageControl.y = srcollView.height - pageControl.height;
    
}
@end
