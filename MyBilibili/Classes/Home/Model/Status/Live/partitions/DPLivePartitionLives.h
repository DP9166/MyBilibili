//
//  DPLivePartitionLives.h
//  MyBilibili
//
//  Created by 段沛 on 16/9/7.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DPLivePartitionLiveOwner;

@interface DPLivePartitionLives : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *room_id;
@property (nonatomic,copy) NSString *area;
@property (nonatomic,copy) NSString *area_id;
@property (nonatomic,copy) NSString *playurl;
@property (nonatomic,copy) NSString *online;


@property (nonatomic,strong) DPLivePartitionLiveOwner *owner;





@end
