//
//  DPHomeBodyContentView.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyContentView.h"
#import "DPHomeBodyContentViewFrame.h"


#import "DPHomeStatusBody.h"
/** 数据*/
#import "DPHomeStatus.h"
/** 子视图*/
#import "DPBodyItemsView.h"

@interface DPHomeBodyContentView()


@property (nonatomic,strong) DPBodyItemsView *bodyItemsView;

@end

@implementation DPHomeBodyContentView


- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        for (NSUInteger i = 0; i <6 ; i++) {
            DPBodyItemsView *bodyItemsView = [[DPBodyItemsView alloc] init];
            self.bodyItemsView = bodyItemsView;
            [self addSubview:bodyItemsView];
            
            
            // 添加手势监听器
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
            [recognizer addTarget:self action:@selector(tapItems:)];
            [bodyItemsView addGestureRecognizer:recognizer];
        }
    }
    return self;
}

/**
 * 监听图片点击
 */
- (void)tapItems:(UITapGestureRecognizer *)recognizer {
    DPBodyItemsView *itemsView = (DPBodyItemsView *)recognizer.view;
    
    // 发送通知  跳转控制器
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[SelectedItem] = itemsView.body;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DPHomeBodySelectedItemsViewNotification object:nil userInfo:userInfo];
}




- (void)setContentBody:(NSArray *)contentBody {
    _contentBody = contentBody;
    for (NSUInteger i = 0; i < 6 ; i++) {
        DPBodyItemsView *bodyItemsView = self.subviews[i];
        
        if (i <self.contentBody.count ) {
            DPHomeStatusBody *body = contentBody[i];
            bodyItemsView.hidden = NO;
            bodyItemsView.body = body;
            bodyItemsView.tag = [body.param integerValue];
        } else {
            bodyItemsView.hidden = YES;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    for (NSUInteger i = 0; i < self.contentBody.count ; i++) {
        DPBodyItemsView *bodyItemsView = self.subviews[i];
        bodyItemsView.width = DPHomeAloneItemWidth;
#warning 这里为什么系数大于1之后会出现概率很大的循环引用问题？
        bodyItemsView.height = DPHomeAloneItemWidth * 1.0;
        bodyItemsView.x = DPHomeStatusMargin + (i%2)*(DPHomeStatusMargin+DPHomeAloneItemWidth);
        bodyItemsView.y = DPHomeStatusMargin+ 25 + (i/2)*(DPHomeStatusMargin+bodyItemsView.height);
    }
}

+ (CGSize)sizeWithItemsCount:(NSInteger)itemsCount {
    NSInteger col = itemsCount /2;
    
    CGFloat itemsW = DPScreenWidth;
    CGFloat itemsH = itemsW * 0.53 * col;
    
    return CGSizeMake(itemsW, itemsH);
}


@end
