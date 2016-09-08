//
//  DPLiveEntranceIcons.h
//  MyBilibili
//
//  Created by 段沛 on 16/9/7.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPLiveEntranceIconsIcon;

@interface DPLiveEntranceIcons : NSObject

@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) DPLiveEntranceIconsIcon *entrance_icon;


@end
