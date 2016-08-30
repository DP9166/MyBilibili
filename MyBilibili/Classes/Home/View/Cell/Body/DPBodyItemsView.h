//
//  DPBodyItemsView.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPBodyItemsView : UIView

@property (nonatomic,strong) NSArray *bodyItems;


+ (CGSize)sizeWithItemsCount:(NSInteger)itemsCount;


@end
