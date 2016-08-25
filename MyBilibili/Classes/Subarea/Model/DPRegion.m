//
//  DPRegion.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/25.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPRegion.h"

@implementation DPRegion

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.imageName = dict[@"imageName"];
    }
    return self;
}

+ (instancetype)RegionWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
