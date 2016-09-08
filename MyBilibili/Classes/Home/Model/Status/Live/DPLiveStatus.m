//
//  DPLiveStatus.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/2.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPLiveStatus.h"

@implementation DPLiveStatus

+ (NSDictionary *)objectClassInArray {
    return @{
             @"banner" : @"DPLiveBanner",
             @"entranceIcons" : @"DPLiveEntranceIcons",
             @"partitions" : @"DPLivePartitions"};
}

@end
