//
//  DPItem.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/26.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPItem.h"

@implementation DPItem

+ (instancetype)itemWithTitle:(NSString *)title imageName:(NSString *)imageName {
    DPItem *item = [[self alloc] init];
    item.title = title;
    item.imageName = imageName;
    return item;
}

@end
