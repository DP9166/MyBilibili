//
//  DPLiveRecommendData.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/2.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPLiveRecommendData.h"
#import "DPLivesCustom.h"

@implementation DPLiveRecommendData


+ (NSDictionary *)objectClassInArray {
    return @{
             @"lives" : [DPLivesCustom class]};
}
@end
