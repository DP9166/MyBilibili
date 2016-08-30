//
//  DPHomeTitleDetailView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeTitleDetailView.h"
#import "DPHomeStatus.h"


#define DPContentTitleFont [UIFont systemFontOfSize:13]
@interface DPHomeTitleDetailView()

@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIImageView *arrowImageView;

@end


@implementation DPHomeTitleDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 首先将所有情况都加入进去
        [self creatTotalView];
    }
    return self;
}

- (void)creatTotalView {
    // 3个部分
    UIImageView *leftImageView = [[UIImageView alloc] init];
    self.leftImageView = leftImageView;
    [self addSubview:leftImageView];
    
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    self.arrowImageView.contentMode = UIViewContentModeCenter;
    self.arrowImageView = arrowImageView;
    [self addSubview:arrowImageView];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = DPContentTitleFont;
    contentLabel.textAlignment = NSTextAlignmentRight;
    self.contentLabel = contentLabel;
    
    [self addSubview:contentLabel];
    [self layoutIfNeeded];
    
}

- (void)setStatus:(DPHomeStatus *)status {
    _status = status;
    
    
    DPLog(@"%f",self.width);
    
    // 进行判断
    if ([status.title isEqualToString:@"热门焦点"]) {
        self.leftImageView.hidden = NO;
        self.leftImageView.image = [UIImage imageNamed:@"hd_home_rank"];
        self.contentLabel.text = @"排行榜";
        [self.contentLabel setTextColor:DPColor(251, 192, 60)];
        self.arrowImageView.image = [UIImage imageNamed:@"common_rightArrowGray"];
    } else if ([status.title isEqualToString:@"热门直播"]) {
        self.leftImageView.hidden = YES;
        self.contentLabel.text = @"当前1024个直播，进去看看";
        [self.contentLabel setTextColor:DPColor(135, 135, 135)];
        self.arrowImageView.image = [UIImage imageNamed:@"common_rightArrowGray"];
    } else {
        self.leftImageView.hidden = YES;
#warning 截取字符串!!!
        self.contentLabel.text = status.title;
        [self.contentLabel setTextColor:DPColor(135, 135, 135)];
        self.arrowImageView.image = [UIImage imageNamed:@"common_rightArrowGray"];
    }
    
    CGFloat contentY = 0;
    CGSize maxSize = CGSizeMake(DPTitleDetailWidth, 20);
    NSDictionary *attribute =@{NSFontAttributeName: DPContentTitleFont};
    
    CGSize contentSize = [self.contentLabel.text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine |
                          NSStringDrawingUsesLineFragmentOrigin |
                          NSStringDrawingUsesFontLeading  attributes:attribute context:nil].size;
    CGFloat contentX =  DPTitleDetailWidth - contentSize.width - 12;
    self.contentLabel.frame = (CGRect){{contentX,contentY},contentSize};
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.arrowImageView.height = 10;
    self.arrowImageView.width = 7;
    self.arrowImageView.y = 3;
    self.arrowImageView.x = self.width - self.arrowImageView.width;
    
    self.leftImageView.width = 20;
    self.leftImageView.height = self.height;
    self.leftImageView.y = 0;
    self.leftImageView.x = self.width - self.arrowImageView.width - self.contentLabel.width - self.leftImageView.width - 8;
    
}
@end
