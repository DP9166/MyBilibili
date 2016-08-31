//
//  DPBodyItemsView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPBodyItemsView.h"
#import "DPCoverImageView.h"

#import "DPHomeStatusBody.h"


#define DPHomeContentItemTitleFont [UIFont systemFontOfSize:10]

@interface DPBodyItemsView()

@property (nonatomic,strong) DPCoverImageView *coverImageView;

@property (nonatomic,strong) UILabel *bottomLabel;

@end


@implementation DPBodyItemsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        DPCoverImageView *coverImageView = [[DPCoverImageView alloc] init];
        coverImageView.backgroundColor = [UIColor grayColor];
        self.coverImageView = coverImageView;
        [self addSubview:coverImageView];
        
        UILabel *bottomLabel = [[UILabel alloc] init];
        bottomLabel.backgroundColor = [UIColor grayColor];
        bottomLabel.font = DPHomeContentItemTitleFont;
        bottomLabel.textColor = [UIColor blackColor];
        bottomLabel.numberOfLines = 2;
        self.bottomLabel = bottomLabel;
        [self addSubview:bottomLabel];
        
    }
    return self;
}


- (void)setBody:(DPHomeStatusBody *)body {
    _body = body;
    
    // 进行判断
    _coverImageView.body = body;
    
    self.bottomLabel.text = body.title;
    
    
    self.bottomLabel.x = 0;
    self.bottomLabel.y = 102+0.3*DPHomeStatusMargin;
    CGSize maxSize = CGSizeMake(DPHomeAloneItemWidth, 44);
    NSDictionary *attribute =@{NSFontAttributeName: DPHomeContentItemTitleFont};
    
    self.bottomLabel.size = [body.title boundingRectWithSize:maxSize options:                NSStringDrawingTruncatesLastVisibleLine |
                             NSStringDrawingUsesLineFragmentOrigin |
                             NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.coverImageView.x = 0;
    self.coverImageView.y = 0;
    self.coverImageView.width = self.width;
    self.coverImageView.height = self.height * 0.7;
    
    DPLog(@"%f",CGRectGetMaxY(self.coverImageView.frame));
    
}

@end
