//
//  DPLiveStatus.h
//  MyBilibili
//
//  Created by 段沛 on 16/9/2.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DPLiveRecommendData;

@interface DPLiveStatus : NSObject

@property (nonatomic,strong) NSMutableArray *banner;
@property (nonatomic,strong) NSArray *entranceIcons;
@property (nonatomic,strong) NSArray *partitions;

@property (nonatomic,strong) DPLiveRecommendData *recommend_data;


@end
