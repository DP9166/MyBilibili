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


#define DPHomeContentItemTitleFont [UIFont systemFontOfSize:12]

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
        bottomLabel.font = DPHomeContentItemTitleFont;
        bottomLabel.textColor = [UIColor blackColor];
        bottomLabel.numberOfLines = 0;
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
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.coverImageView.x = 0;
    self.coverImageView.y = 0;
    self.coverImageView.width = self.width;
    self.coverImageView.height = self.height * 0.7;

    self.bottomLabel.x = 0;
    self.bottomLabel.y = CGRectGetMaxY(self.coverImageView.frame)+0.3*DPHomeStatusMargin;
    CGSize maxSize = CGSizeMake(self.width, self.height - CGRectGetHeight(self.coverImageView.frame));
    NSDictionary *attribute =@{NSFontAttributeName: DPHomeContentItemTitleFont};
    
    self.bottomLabel.size = [self.body.title boundingRectWithSize:maxSize options:                NSStringDrawingTruncatesLastVisibleLine |
                             NSStringDrawingUsesLineFragmentOrigin |
                             NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    DPLog(@"%@",self.bottomLabel);
    
}

@end
