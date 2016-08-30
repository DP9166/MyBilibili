//
//  DPHomeNormalViewFrame.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DPHomeStatus,DPHomeBodyTitleViewFrame,DPHomeBodyContentViewFrame;

@interface DPHomeNormalViewFrame : NSObject

@property (nonatomic,strong) DPHomeBodyTitleViewFrame *titleViewFrame;
@property (nonatomic,strong) DPHomeBodyContentViewFrame *contentViewFrame;


@property (nonatomic,strong) DPHomeStatus *status;
/** 
 * 自己的frame
 */
@property (nonatomic,assign) CGRect frame;

@end
