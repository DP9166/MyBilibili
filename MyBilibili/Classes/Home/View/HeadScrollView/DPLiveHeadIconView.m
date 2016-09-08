//
//  DPLiveHeadIconView.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/8.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPLiveHeadIconView.h"

#import "UIImageView+WebCache.h"


@interface DPLiveHeadIconView()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation DPLiveHeadIconView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initWithBasicView];
    }
    return self;
}

- (void)initWithBasicView {
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconImageView = iconImageView;
    [self addSubview:iconImageView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
}



- (void)setIconStr:(NSString *)iconStr {
    _iconStr = iconStr;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:iconStr] placeholderImage:nil];
    
    
    if ([iconStr containsString:@"live_partitionEntrance"]) {
        self.iconImageView.image = [UIImage imageNamed:iconStr];
    }
    
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconImageView.width = 30;
    self.iconImageView.height = 30;
    self.iconImageView.x = (self.width -self.iconImageView.width)*0.5;
    self.iconImageView.y = self.height*0.6 -self.iconImageView.height;
    
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height * 0.35;
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.iconImageView.frame);
    
}

@end
