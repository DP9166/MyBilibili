//
//  DPRegionCollectionCell.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/25.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPRegionCollectionCell.h"
#import "DPRegion.h"

@interface DPRegionCollectionCell()
@property (nonatomic,strong) UIImageView *borderView;
@property (nonatomic,strong) UIImageView *logoImgView;
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation DPRegionCollectionCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        
        [self displayView];
    }
    return self;
}


- (void)setRegion:(DPRegion *)region {
    _region = region;
    _titleLabel.text = region.title;
    _logoImgView.image = [UIImage imageNamed:region.imageName];
    
    if ([_titleLabel.text isEqualToString:@"游戏中心"]) {
        DPLog(@"23424");
        self.borderView.image = [UIImage imageNamed:@"home_exregion_border"];
    } else {
        DPLog(@"186697");
        self.borderView.image = [UIImage imageNamed:@"home_region_border"];
    }
    
}

- (void)displayView {
    
    UIImageView *borderView = [[UIImageView alloc] init];
    self.borderView = borderView;
    [self.contentView addSubview:borderView];
    
    
    
    _logoImgView = [[UIImageView alloc] init];
    _logoImgView.contentMode = UIViewContentModeScaleAspectFit;
    
    _logoImgView.autoresizesSubviews = YES;
    
    _logoImgView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [borderView addSubview:_logoImgView];
    
    
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setFont:[UIFont systemFontOfSize:14]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setTextColor:DPColor(169, 169, 169)];
    [self.contentView addSubview:_titleLabel];
    
}

- (void)layoutSubviews {
    UIImageView *borderView = [self.contentView.subviews firstObject];
    borderView.x = 0;
    borderView.y = 0;
    borderView.width = self.width * 0.8;
    borderView.height = self.height * 0.8;
    
    
    UILabel *titleLabel = [self.contentView.subviews lastObject];
    titleLabel.x = 0;
    titleLabel.y = CGRectGetMaxY(borderView.frame);
    titleLabel.width = borderView.width;
    titleLabel.height = self.height - borderView.height;
    
    
    UIImageView *logoImgView = [self.borderView.subviews firstObject];
    logoImgView.x = 10;
    logoImgView.y = 6;
    logoImgView.width = borderView.width - logoImgView.x * 2;
    logoImgView.height = borderView.height - logoImgView.y * 2;
}
@end
