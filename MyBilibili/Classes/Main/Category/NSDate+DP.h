//
//  NSDate+DP.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/31.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DP)

- (BOOL)isToday;
- (BOOL)isYesterday;

- (NSDateComponents *)deltaWithNow;

@end
