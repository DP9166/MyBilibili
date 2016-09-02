//
//  DPLiveRecommendData.h
//  MyBilibili
//
//  Created by 段沛 on 16/9/2.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPLivePartition;

@interface DPLiveRecommendData : NSObject

@property (nonatomic,strong) NSArray *lives;
@property (nonatomic,strong) DPLivePartition *partition;
@property (nonatomic,strong) NSArray *banner_data;

@end
