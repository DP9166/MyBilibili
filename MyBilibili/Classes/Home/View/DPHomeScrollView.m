//
//  DPHomeScrollView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/28.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeScrollView.h"

#import "DPHomeBanner.h"
#import "UIImageView+WebCache.h"


@interface DPHomeScrollView()

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) NSArray *bannerArr;
@end

@implementation DPHomeScrollView


- (NSArray *)bannerArr
{
    if(!_bannerArr){
        self.bannerArr = [[NSArray alloc] init];
    }
    return _bannerArr;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        [self abc];
    }
    return self;
}


- (void) abc {
    
    DPLog(@"%lu",(unsigned long)self.bannerArr.count);
    for (NSUInteger i = 0; i <self.bannerArr.count ; i++) {
        DPHomeBanner *banner = self.bannerArr[i];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:banner.imageurl] placeholderImage:nil];
        self.imageView = imageView;
        [self addSubview:imageView];
    }
}


- (void)setBannerArray:(NSArray *)bannerArray {
    _bannerArray = bannerArray;
    
    self.contentSize = CGSizeMake(DPScreenWidth * bannerArray.count, 0);

    self.bannerArr = bannerArray;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    for (NSUInteger i = 0; i <self.subviews.count ; i++) {
    
        UIImageView *imageView = self.subviews[i];
        imageView.width = self.width;
        imageView.height = self.height;
        imageView.y = 0;
        imageView.x = imageView.width * i;
    }
}
@end
