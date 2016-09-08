//
//  DPHomeLiveCell.h
//  MyBilibili
//
//  Created by 段沛 on 16/9/7.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPLivePartitions;


@interface DPHomeLiveCell : UITableViewCell


@property (nonatomic,strong) DPLivePartitions *partitions;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
