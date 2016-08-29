//
//  DPHomeBodyTableCell.h
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPHomeStatusFrame;

@interface DPHomeBodyTableCell : UITableViewCell


@property (nonatomic,strong) DPHomeStatusFrame *statusFrame;


+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
