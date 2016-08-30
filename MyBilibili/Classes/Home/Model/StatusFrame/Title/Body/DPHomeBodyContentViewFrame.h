//
//  DPHomeBodyContentViewFrame.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DPHomeStatus,DPBodyItemsViewFrame;

@interface DPHomeBodyContentViewFrame : NSObject


@property (nonatomic,strong) DPBodyItemsViewFrame *itemFrame;

/** 自己的frame */
@property (nonatomic, assign) CGRect frame;
/** 数据 */
@property (nonatomic,strong) DPHomeStatus *status;


@end
