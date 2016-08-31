//
//  DPHomeBodyContentView.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPHomeBodyContentViewFrame;

@interface DPHomeBodyContentView : UIView


@property (nonatomic,strong) NSArray *contentBody;


+ (CGSize)sizeWithItemsCount:(NSInteger)itemsCount;

@end
