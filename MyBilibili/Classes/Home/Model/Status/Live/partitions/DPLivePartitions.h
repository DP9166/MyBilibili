//
//  DPLivePartitions.h
//  MyBilibili
//
//  Created by 段沛 on 16/9/7.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DPLivePartition.h"

@interface DPLivePartitions : NSObject

@property (nonatomic,strong) DPLivePartition *partition;
@property (nonatomic,strong) NSArray *lives;
@end
