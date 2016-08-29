//
//  DPHomeStatus.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/28.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DPHomeStatusHead.h"
#import "DPHomeStatusBody.h"

@interface DPHomeStatus : NSObject

@property (nonatomic,copy) NSString *type;
@property (nonatomic,strong) DPHomeStatusHead *head;
@property (nonatomic,strong) DPHomeStatusBody *body;


@end
