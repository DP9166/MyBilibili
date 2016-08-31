//
//  NSDate+DP.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/31.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "NSDate+DP.h"

@implementation NSDate (DP)

- (BOOL)isToday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitYear;
    // 1. 当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2. self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

- (BOOL)isYesterday
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}

- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

- (NSDateComponents *)deltaWithNow {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

- (NSDateComponents *)deltaWithTime {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}


@end
