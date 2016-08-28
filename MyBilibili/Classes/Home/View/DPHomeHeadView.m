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

@interface DPHomeHeadView()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *srcollView;
@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,strong) NSTimer *timer;

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
    
    srcollView.delegate = self;
    self.srcollView = srcollView;
    [self addSubview:srcollView];
    
    [self addTimer];
}

- (void)nextPage {
    // 当前页数
    int page = (int)(self.srcollView.contentOffset.x / DPScreenWidth + 0.5) % self.bannerArray.count;
    
    if (_srcollView.contentOffset.x > 960) {
        page = 0;
        [self.srcollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    [self.srcollView setContentOffset:CGPointMake((page+1)*DPScreenWidth, 0) animated:YES];

}


- (void)setBannerArray:(NSMutableArray *)bannerArray {
    _bannerArray = bannerArray;
    
    // 设置滚动
    self.srcollView.contentSize = CGSizeMake(DPScreenWidth *(bannerArray.count + 2), 0);
    
    // 图片
    DPHomeBanner *startBanner = [bannerArray lastObject];
    UIImageView *startImageView = [[UIImageView alloc] init];
    [startImageView sd_setImageWithURL:[NSURL URLWithString:startBanner.imageurl] placeholderImage:nil];
    [self.srcollView addSubview:startImageView];
    
    for (NSUInteger i = 0; i < bannerArray.count ; i++) {
        
        DPHomeBanner *banner = bannerArray[i];
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:banner.imageurl] placeholderImage:nil];
        [self.srcollView addSubview:imageView];
    }
    
    DPHomeBanner *endBanner = [bannerArray firstObject];
    UIImageView *endImageView = [[UIImageView alloc] init];
    [endImageView sd_setImageWithURL:[NSURL URLWithString:endBanner.imageurl] placeholderImage:nil];
    [self.srcollView addSubview:endImageView];
    
    [self.srcollView setContentOffset:CGPointMake(DPScreenWidth, 0)];
    
    // 小白圈
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = bannerArray.count;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = DPColor(247, 88, 135);
    pageControl.defersCurrentPageDisplay = YES;
    self.pageControl = pageControl;
    [self addSubview:pageControl];
}

- (void)addTimer {
    // 添加定时器
    self.timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}
#pragma mark - 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    int page = (int)(self.srcollView.contentOffset.x / DPScreenWidth + 0.5) % self.bannerArray.count;
    
    if (page == 0) {
        self.pageControl.currentPage = 3;
    } else {
        self.pageControl.currentPage = page -1;
    }
    
    if (scrollView.contentOffset.x > 1280) {
        [self.srcollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    if (scrollView.contentOffset.x <0) {
        [self.srcollView setContentOffset:CGPointMake(1280, 0) animated:NO];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
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
