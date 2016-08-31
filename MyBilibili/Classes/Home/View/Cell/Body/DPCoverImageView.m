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
@property (nonatomic,strong) UIView *normalView;
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
        
        
        
        [self settingNormalView];

        //
//        [self settiingLiveBottomView];
//        
        [self settiingBangumiBottomView];
        
    }
    return self;
}


- (void)settingNormalView {
    UIView *normalView = [[UIView alloc] init];
    self.normalView = normalView;
    [self addSubview:normalView];
    //
    //        // 创建bottomView的子控件(2个UILabel 2个)
    UIImageView *playImageView = [[UIImageView alloc] init];
    playImageView.image = [UIImage imageNamed:@"misc_playCount_new"];
    self.playImageView = playImageView;
    [normalView addSubview:playImageView];
    
    UILabel *playLabel = [[UILabel alloc] init];
    playLabel.textColor = [UIColor whiteColor];
    playLabel.font = DPHomeAloneItemBottomTitleFont;
    self.playLabel = playLabel;
    [normalView addSubview:playLabel];
    
    UIImageView *danmukuImageView = [[UIImageView alloc] init];
    danmukuImageView.image = [UIImage imageNamed:@"misc_danmakuCount_new"];
    self.danmukuImageView = danmukuImageView;
    [normalView addSubview:danmukuImageView];
    
    UILabel *danmukuLabel = [[UILabel alloc] init];
    danmukuLabel.font = DPHomeAloneItemBottomTitleFont;
    danmukuLabel.textColor = [UIColor whiteColor];
    self.danmukuLabel = danmukuLabel;
    [normalView addSubview:danmukuLabel];
}

- (void)settiingBangumiBottomView {
    UILabel *bangumiBottomLabel = [[UILabel alloc] init];
    bangumiBottomLabel.textColor = [UIColor whiteColor];
    bangumiBottomLabel.font = DPHomeAloneItemBottomTitleFont;
    self.bangumiBottomLabel = bangumiBottomLabel;
    [self addSubview:bangumiBottomLabel];
}

- (void)setBody:(DPHomeStatusBody *)body {
    _body = body;
    
    [self sd_setImageWithURL:[NSURL URLWithString:body.cover] placeholderImage:nil];
    
    if (body.online) {
        self.normalView.hidden = YES;
        self.bangumiBottomLabel.hidden = YES;
    } else if (body.mtime) {
        self.normalView.hidden = YES;
        self.bangumiBottomLabel.hidden = NO;
        
        NSString *index = [NSString stringWithFormat:@"第%@话",body.index];
        self.bangumiBottomLabel.text = [NSString stringWithFormat:@"%@  ·  %@",body.mtime,index];
    } else {
        self.normalView.hidden = NO;
        self.bangumiBottomLabel.hidden = YES;
        self.playLabel.text = body.play;
        self.danmukuLabel.text = body.danmaku;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.normalView.x = 0;
    self.normalView.y = self.height -DPHomeStatusMargin*0.5-self.playImageView.height;
    self.normalView.width = self.width;
    self.normalView.height = 20;
    
    self.playImageView.x = DPHomeStatusMargin;
    self.playImageView.width = 14;
    self.playImageView.height = 10;
    self.playImageView.y = 0;
    
    self.playLabel.x = 0.3 *DPHomeStatusMargin + CGRectGetMaxX(self.playImageView.frame);
    self.playLabel.y = self.playImageView.y -5;
    self.playLabel.width = 60;
    self.playLabel.height = 20;
    
    self.danmukuImageView.x = self.width * 0.5;
    self.danmukuImageView.y = self.playImageView.y;
    self.danmukuImageView.width = 14;
    self.danmukuImageView.height = 10;
    
    self.danmukuLabel.x = 0.3*DPHomeStatusMargin + CGRectGetMaxX(self.danmukuImageView.frame);
    self.danmukuLabel.y = self.playLabel.y;
    self.danmukuLabel.width = 60;
    self.danmukuLabel.height = 20;
    
    // bangumi
    self.bangumiBottomLabel.x = DPHomeStatusMargin;
    self.bangumiBottomLabel.width = self.width;
    self.bangumiBottomLabel.height = 20;
    self.bangumiBottomLabel.y = self.height - self.normalView.height;
}

@end
