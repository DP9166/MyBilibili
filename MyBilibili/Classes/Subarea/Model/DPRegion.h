//
//  DPRegion.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/25.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPRegion : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imageName;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)RegionWithDict:(NSDictionary *)dict;

@end
