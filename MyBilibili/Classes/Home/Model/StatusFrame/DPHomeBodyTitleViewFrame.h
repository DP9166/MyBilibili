//
//  DPHomeBodyTitleViewFrame.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DPHomeStatus;

#define DPHomeBodyTitleFont [UIFont systemFontOfSize:14]



@interface DPHomeBodyTitleViewFrame : NSObject


/** icon图标*/
@property (nonatomic,assign) CGRect iconFrame;
/** 标题*/
@property (nonatomic,assign) CGRect titleFrame;

/** 自己的frame */
@property (nonatomic, assign) CGRect frame;
/** 数据 */
@property (nonatomic,strong) DPHomeStatus *status;
@end
