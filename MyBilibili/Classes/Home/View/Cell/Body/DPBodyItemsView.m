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

@interface DPBodyItemsView()

@property (nonatomic,strong) DPCoverImageView *coverImageView;
@end


@implementation DPBodyItemsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //1. 创建6个UIImageView
        DPCoverImageView *coverImageView = [[DPCoverImageView alloc] init];
        coverImageView.backgroundColor = [UIColor grayColor];
        self.coverImageView = coverImageView;
        [self addSubview:coverImageView];
        
    }
    return self;
}


- (void)setBody:(DPHomeStatusBody *)body {
    _body = body;
    
    // 进行判断
    _coverImageView.body = body;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.coverImageView.x = 0;
    self.coverImageView.y = 0;
    self.coverImageView.width = self.width;
    self.coverImageView.height = self.height * 0.7;
    
}

@end
