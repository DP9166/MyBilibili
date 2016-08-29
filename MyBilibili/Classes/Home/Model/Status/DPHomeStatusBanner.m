//
//  DPHomeStatusBanner.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeStatusBanner.h"

#import "DPHomeStatusBottom.h"

@implementation DPHomeStatusBanner

- (NSDictionary *)objectClassInArray {
    return @{
             @"bottom" : [DPHomeStatusBottom class]};
}

@end
