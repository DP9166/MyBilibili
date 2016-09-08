//
//  DPHomeLiveCell.m
//  MyBilibili
//
//  Created by 段沛 on 16/9/7.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeLiveCell.h"

#import "DPLiveStatus.h"
#import "DPLiveBanner.h"

#import "DPLivePartitions.h"
#import "DPLivePartition.h"

#import "UIImageView+WebCache.h"


@interface DPHomeLiveCell()

@property (nonatomic,strong) UIImageView *bannerImageView;

@end

@implementation DPHomeLiveCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = DPColor(241, 241, 241);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 初始化子控件
        [self initWithBasicView];
        
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"status";
    DPHomeLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DPHomeLiveCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (void)initWithBasicView {
    // headView
    
}

- (void)setPartitions:(DPLivePartitions *)partitions {
    _partitions = partitions;
    
    DPLivePartition *partition = partitions.partition;
    
}

@end
