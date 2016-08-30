//
//  DPHomeBodyTitleView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyTitleView.h"
#import "DPHomeBodyTitleViewFrame.h"
#import "DPHomeStatus.h"
#import "DPHomeStatusBanner.h"

#import "DPHomeTitleDetailView.h"

@interface DPHomeBodyTitleView()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) DPHomeTitleDetailView *detailView;

@property (nonatomic,strong) NSDictionary *iconDict;
@end

@implementation DPHomeBodyTitleView

#pragma mark - lazy
- (NSDictionary *)iconDict
{
    if(!_iconDict){
        self.iconDict = [NSDictionary dictionaryWithObjectsAndKeys:@"home_recommend",@"热门焦点",
                         @"home_region_icon_live",@"热门直播",
                         @"category_cinema_icon",@"番剧推荐",
                         @"home_region_icon_1",@"动画区",
                         @"home_region_icon_3",@"音乐区",
                         @"home_region_icon_129",@"舞蹈区",
                         @"home_region_icon_4",@"游戏区",
                         @"home_region_icon_119",@"鬼畜区",
                         @"home_region_icon_36",@"科技区",
                         @"home_region_icon_160",@"生活区",
                         @"home_region_icon_146",@"时尚区",
                         @"home_region_icon_155",@"娱乐区",
                         @"home_region_icon_11",@"电视剧区",
                         @"home_search_icon_movie",@"电影区",
                         nil];
    }
    return _iconDict;
}



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews {
    UIImageView *iconImageView = [[UIImageView alloc] init];
    self.iconImageView = iconImageView;
    [self addSubview:iconImageView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    DPHomeTitleDetailView *detailView = [[DPHomeTitleDetailView alloc] init];
    self.detailView = detailView;
    [self addSubview:detailView];
    
}

- (void)setTitleViewFrame:(DPHomeBodyTitleViewFrame *)titleViewFrame {
    _titleViewFrame = titleViewFrame;
    
    DPHomeStatus *status = titleViewFrame.status;
    
    self.iconImageView.frame = titleViewFrame.iconFrame;
    self.iconImageView.image = [UIImage imageNamed:self.iconDict[status.title]];
    
    self.titleLabel.text = status.title;
    self.titleLabel.font = DPHomeBodyTitleFont;
    self.titleLabel.frame = titleViewFrame.titleFrame;
    
    self.detailView.status = status;
    self.detailView.frame = titleViewFrame.detailFrame;
    
    
}

@end
