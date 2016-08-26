//
//  DPItem.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/26.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPItem : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imageName;

+ (instancetype)itemWithTitle:(NSString *)title imageName:(NSString *)imageName;
@end
