//
//  DPHomeStatusBody.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//
#import "DPHomeStatusBody.h"

@implementation DPHomeStatusBody
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"myGoto" : @"goto",
             };
}

- (NSString *)play {
    CGFloat playCount = [_play floatValue];
    
    if (playCount >= 10000) { // 截取前两位数
        NSString *newPlay = [NSString stringWithFormat:@"%.1f%@",playCount/10000,@"万"];
        return newPlay;
    } else {
        return _play;
    }
}

- (NSString *)danmaku {
    CGFloat danmuku = [_danmaku floatValue];
    
    if (danmuku >= 10000) { // 截取前两位数
        NSString *newDanmuku = [NSString stringWithFormat:@"%.1f%@",danmuku/10000,@"万"];
        return newDanmuku;
    } else {
        return _danmaku;
    }
}

- (NSString *)mtime {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];

    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss.S";
    // 保证时间正确
//    [fmt setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *createTime = [fmt dateFromString:_mtime];
    
#warning 错误  ---   待会需要修改！
    // 做比较   --- 时间
    if (createTime.isToday) {
        NSDateComponents *cmps = [createTime deltaWithNow];
        if (cmps.hour < 1) {
            fmt.dateFormat = @"HH:mm";
            return [fmt stringFromDate:createTime];
        } else if(cmps.hour > 10){
            fmt.dateFormat = @"凌晨 HH:mm";
            return [fmt stringFromDate:createTime];
        }
    } else if (createTime.isYesterday){
        fmt.dateFormat = @"昨天 HH:mm";
//        DPLog(@"[fmt stringFromDate:createTime] -- %@",[fmt stringFromDate:createTime]);
        return [fmt stringFromDate:createTime];
    }
    
    return _mtime;
}
@end
