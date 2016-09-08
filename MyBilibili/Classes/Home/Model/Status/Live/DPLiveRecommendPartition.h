//
//  DPLiveBannerData.h
//  MyBilibili
//
//  Created by 段沛 on 16/9/2.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DPLivePartitionSubIcon;

@interface DPLiveRecommendPartition : NSObject

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *area;
@property (nonatomic,strong) DPLivePartitionSubIcon *sub_icon;
@property (nonatomic,copy) NSString *count;





@end
