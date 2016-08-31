//
//  DPHomeStatus.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/28.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeStatus.h"
#import "DPHomeStatusBody.h"
#import "DPHomeStatusBanner.h"

@implementation DPHomeStatus

+ (NSDictionary *)objectClassInArray {
    return @{
             @"body" : [DPHomeStatusBody class],
             @"banner" : [DPHomeStatusBanner class]};
}

@end
