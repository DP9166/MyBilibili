//
//  DPCoverImageView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPCoverImageView.h"
#import "DPHomeStatusBody.h"

#import "UIImageView+WebCache.h"

#define DPHomeAloneItemBottomTitleFont [UIFont systemFontOfSize:10]


@interface DPCoverImageView()


/** "type": "bangumi" + "recommed"*/
@property (nonatomic,strong) UIView *normalBottomView;
@property (nonatomic,strong) UIImageView *playImageView;
@property (nonatomic,strong) UILabel *playLabel;
@property (nonatomic,strong) UIImageView *danmukuImageView;
@property (nonatomic,strong) UILabel *danmukuLabel;


/** "type": "live"  */
@property (nonatomic,strong) UIImageView *upfaceImageView;

/** bangumi   */
@property (nonatomic,strong) UILabel *bangumiBottomLabel;


@end

@implementation DPCoverImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CALayer *layer = [self layer];
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:10.f];
        
        // 创建一个bottom栏
        UIView *normalBottomView = [[UIView alloc] init];
        self.normalBottomView = normalBottomView;
        [self addSubview:normalBottomView];
        
        
        // 创建bottomView的子控件(2个UILabel 2个)
        UIImageView *playImageView = [[UIImageView alloc] init];
        playImageView.image = [UIImage imageNamed:@"misc_playCount_new"];
        self.playImageView = playImageView;
        [normalBottomView addSubview:playImageView];
        
        UILabel *playLabel = [[UILabel alloc] init];
        playLabel.textColor = [UIColor whiteColor];
        playLabel.font = DPHomeAloneItemBottomTitleFont;
        self.playLabel = playLabel;
        [normalBottomView addSubview:playLabel];
        
        
        UIImageView *danmukuImageView = [[UIImageView alloc] init];
        danmukuImageView.image = [UIImage imageNamed:@"misc_danmakuCount_new"];
        self.danmukuImageView = danmukuImageView;
        [normalBottomView addSubview:danmukuImageView];
        
        UILabel *danmukuLabel = [[UILabel alloc] init];
        danmukuLabel.font = DPHomeAloneItemBottomTitleFont;
        danmukuLabel.textColor = [UIColor whiteColor];
        self.danmukuLabel = danmukuLabel;
        [normalBottomView addSubview:danmukuLabel];
        
        [self settiingLiveBottomView];
        
        [self settiingBangumiBottomView];
        
    }
    return self;
}

- (void)settiingBangumiBottomView {
    UILabel *bangumiBottomLabel = [[UILabel alloc] init];
    bangumiBottomLabel.textColor = [UIColor whiteColor];
    bangumiBottomLabel.font = DPHomeAloneItemBottomTitleFont;
    self.bangumiBottomLabel = bangumiBottomLabel;
    [self addSubview:bangumiBottomLabel];
}

- (void)settiingLiveBottomView {
    UIImageView *upfaceImageView = [[UIImageView alloc] init];
    self.upfaceImageView = upfaceImageView;
    [self addSubview:upfaceImageView];
    
}

- (void)setBody:(DPHomeStatusBody *)body {
    _body = body;
    
    [self sd_setImageWithURL:[NSURL URLWithString:body.cover] placeholderImage:nil];
    
    
    if (body.online) {
        self.normalBottomView.hidden = YES;
        self.bangumiBottomLabel.hidden = YES;
        
    } else if (body.mtime) {
        self.normalBottomView.hidden = YES;
        self.bangumiBottomLabel.hidden = NO;
        
        NSString *index = [NSString stringWithFormat:@"第%@话",body.index];
        self.bangumiBottomLabel.text = [NSString stringWithFormat:@"%@  ·  %@",body.mtime,index];
        
    } else {
        self.normalBottomView.hidden = NO;
        self.bangumiBottomLabel.hidden = YES;
        
        self.playLabel.text = body.play;
        self.danmukuLabel.text = body.danmaku;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView *normalBottomView = [self.subviews firstObject];
    normalBottomView.x = 0;
    normalBottomView.width = self.width;
    normalBottomView.height = 20;
    normalBottomView.y = self.height - normalBottomView.height;
    
    
    self.playImageView.x = DPHomeStatusMargin;
    self.playImageView.y = 5;
    self.playImageView.width = 14;
    self.playImageView.height = 10;
    
    self.playLabel.x = 0.3 *DPHomeStatusMargin + CGRectGetMaxX(self.playImageView.frame);
    self.playLabel.y = 0;
    self.playLabel.width = 60;
    self.playLabel.height = 20;
    
    self.danmukuImageView.x = self.width * 0.5;
    self.danmukuImageView.y = 5;
    self.danmukuImageView.width = 14;
    self.danmukuImageView.height = 10;
    
    self.danmukuLabel.x = 0.3*DPHomeStatusMargin + CGRectGetMaxX(self.danmukuImageView.frame);
    self.danmukuLabel.y = 0;
    self.danmukuLabel.width = 60;
    self.danmukuLabel.height = 20;
    
    
    self.upfaceImageView.x = DPHomeStatusMargin * 0.5;
    self.upfaceImageView.width = 30;
    self.upfaceImageView.height = 30;
    self.upfaceImageView.y = 0;
    
    self.bangumiBottomLabel.x = DPHomeStatusMargin;
    self.bangumiBottomLabel.width = self.width;
    self.bangumiBottomLabel.height = 20;
    self.bangumiBottomLabel.y = self.height - normalBottomView.height;
}

@end
