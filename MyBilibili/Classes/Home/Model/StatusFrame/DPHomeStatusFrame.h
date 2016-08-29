//
//  DPHomeStatusFrame.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DPHomeNormalViewFrame.h"
#import "DPHomeStatus.h"
@interface DPHomeStatusFrame : NSObject

@property (nonatomic,strong) DPHomeNormalViewFrame *normalViewFrame;

@property (nonatomic,strong) DPHomeStatus *status;
@property (nonatomic,assign) CGFloat cellHeight;


@end
