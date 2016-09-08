//
//  DPLiveHeadView.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/8.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPLiveHeadView.h"

#import "UIImageView+WebCache.h"

#import "DPLiveBanner.h"
#import "DPLiveEntranceIcons.h"
#import "DPLiveEntranceIconsIcon.h"

#import "DPLiveHeadIconView.h"


@interface DPLiveHeadView()

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) DPLiveHeadIconView *entranceIconsView;

@end

@implementation DPLiveHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = DPColor(241, 241, 241);

        [self initWithBasicView];
    }
    return self;
}

- (void)initWithBasicView {
    // 创建头部视图
    UIImageView *headImageView = [[UIImageView alloc] init];
    
    self.headImageView = headImageView;
    [self addSubview:headImageView];
    
    // 创建8个UIView
    for (NSUInteger i = 0; i <8 ; i++) {
        DPLiveHeadIconView *entranceIconsView = [[DPLiveHeadIconView alloc] init];
        self.entranceIconsView = entranceIconsView;
        [self addSubview:entranceIconsView];
    }
    
    // 创建底部bottom
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor redColor];
    bottomView.layer.cornerRadius = 8.0f;
    bottomView.backgroundColor = DPColor(247, 88, 135);
    [self addSubview:bottomView];
    
}

- (void)setBannerArr:(NSArray *)bannerArr {
    _bannerArr = bannerArr;
    
    DPLiveBanner *banner = [bannerArr firstObject];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:banner.img] placeholderImage:nil];
}


- (void)setEntranceIconsArr:(NSArray *)entranceIconsArr {
    _entranceIconsArr = entranceIconsArr;
    
    for (NSUInteger i = 1; i <9 ; i++) {
        DPLiveHeadIconView *entranceIconsView =  self.subviews[i];
        if (i <= entranceIconsArr.count) {
            DPLiveEntranceIcons *entranceIcons = entranceIconsArr[i-1];
            DPLiveEntranceIconsIcon *icon = entranceIcons.entrance_icon;
            entranceIconsView.iconStr = icon.src;
            
            entranceIconsView.titleStr = entranceIcons.name;
            
        } else {
            NSString *iconStr = [NSString stringWithFormat:@"live_partitionEntrance%lu",i-7];
            entranceIconsView.iconStr = iconStr;
            if (i == 7) entranceIconsView.titleStr =@"全部分类";
            if (i == 8) entranceIconsView.titleStr =@"全部直播";
        }
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.headImageView.x = 0;
    self.headImageView.y = 0;
    self.headImageView.width = self.width;
    self.headImageView.height = self.height * 0.33;
    
    
    for (NSUInteger i = 1; i < self.subviews.count ; i++) {
        UIView *entranceIconsView = self.subviews[i];
        entranceIconsView.width = self.width *0.25;
        entranceIconsView.height = entranceIconsView.width;
        entranceIconsView.x = ((i-1)%4) *(entranceIconsView.width);
        entranceIconsView.y = CGRectGetMaxY(self.headImageView.frame) + ((i-1)/4) *(entranceIconsView.height);
    }
    
    UIView *bottomView = [self.subviews lastObject];
    bottomView.x = DPHomeStatusMargin;
    bottomView.width = self.width - 2*DPHomeStatusMargin;
    bottomView.height = self.height - CGRectGetMaxY(self.entranceIconsView.frame);
    bottomView.y = CGRectGetMaxY(self.entranceIconsView.frame);
}
@end
