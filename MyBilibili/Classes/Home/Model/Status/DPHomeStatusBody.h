//
//  DPHomeStatusBody.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPHomeStatusBody : NSObject


@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *cover;
@property (nonatomic,copy) NSString *uri;
@property (nonatomic,copy) NSString *param;
@property (nonatomic,copy) NSString *myGoto;
/** 热门推荐*/
@property (nonatomic,copy) NSString *play;
@property (nonatomic,copy) NSString *danmaku;
/** 直播*/
@property (nonatomic,copy) NSString *area;
@property (nonatomic,copy) NSString *area_id;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *face;
@property (nonatomic,copy) NSString *online;
/** 番剧推荐*/
@property (nonatomic,copy) NSString *index;
@property (nonatomic,copy) NSString *mtime;  // "mtime": "2016-08-29 17:05:09.0"






@end
