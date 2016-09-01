//
//  DPHomeBodyBannerViewFrame.h
//  MyBilibili
//
//  Created by 段沛 on 16/9/1.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DPHomeStatusBanner;

@interface DPHomeBodyBannerViewFrame : NSObject


@property (nonatomic,assign) CGRect bottomViewFrame;


@property (nonatomic,strong) DPHomeStatusBanner *banner;

@property (nonatomic,assign) CGRect frame;

@end
