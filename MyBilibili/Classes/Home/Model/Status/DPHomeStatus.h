//
//  DPHomeStatus.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/28.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DPHomeStatusBody.h"

#import "DPHomeStatusBanner.h"

@interface DPHomeStatus : NSObject

@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *style;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *param;

@property (nonatomic,strong) NSArray *body;

@property (nonatomic,strong) DPHomeStatusBanner *banner;

@end
