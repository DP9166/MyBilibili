//
//  DPBodyItemsView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPBodyItemsView.h"
#import "DPCoverImageView.h"


#define DPHomeAloneItemWidth (DPScreenWidth - 3*DPHomeStatusMargin)*0.5

@interface DPBodyItemsView()

@property (nonatomic,strong) DPCoverImageView *coverImageView;
@end


@implementation DPBodyItemsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1. 创建6个UIImageView
        for (NSUInteger i = 0; i <6 ; i++) {
            DPCoverImageView *coverImageView = [[DPCoverImageView alloc] init];
            self.coverImageView = coverImageView;
            [self addSubview:coverImageView];
        }
    }
    return self;
}


- (void)setBodyItems:(NSArray *)bodyItems {
    _bodyItems = bodyItems;
    
    for (NSUInteger i = 0; i <6 ; i++) {
        DPCoverImageView *coverImageView = self.subviews[i];
        if (i <bodyItems.count) {
            coverImageView.body = bodyItems[i];
            coverImageView.hidden = NO;
        } else {
            coverImageView.hidden = YES;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (NSUInteger i = 0; i < self.bodyItems.count ; i++) {
        DPCoverImageView *coverImageView = self.subviews[i];
        coverImageView.width = DPHomeAloneItemWidth;
        coverImageView.height = DPHomeAloneItemWidth * 0.6;
        coverImageView.x = DPHomeStatusMargin + (i%2)*(DPHomeStatusMargin+DPHomeAloneItemWidth);
        coverImageView.y = DPHomeStatusMargin+ 25 + (i/2)*(DPHomeStatusMargin+coverImageView.height);
    }
}




+ (CGSize)sizeWithItemsCount:(NSInteger)itemsCount {
    NSInteger col = itemsCount /2;
    
    CGFloat itemsW = DPScreenWidth;
    CGFloat itemsH = itemsW * 0.6 * col;
    
    return CGSizeMake(itemsW, itemsH);
}

@end
