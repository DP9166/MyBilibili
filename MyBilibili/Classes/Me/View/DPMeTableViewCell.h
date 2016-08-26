//
//  DPMeTableViewCell.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/26.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPGroupItem;

@interface DPMeTableViewCell : UITableViewCell

@property (nonatomic, strong) DPGroupItem *groupItems;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
