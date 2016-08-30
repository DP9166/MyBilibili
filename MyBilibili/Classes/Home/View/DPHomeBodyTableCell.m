//
//  DPHomeBodyTableCell.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPHomeBodyTableCell.h"

#import "DPHomeNormalView.h"

#import "DPHomeStatusFrame.h"

@interface DPHomeBodyTableCell()


@property (nonatomic,strong) DPHomeNormalView *normalView;

@end


@implementation DPHomeBodyTableCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化子控件
        [self initWithNormalView];
        
    }
    return self;
}


- (void)initWithNormalView {
    DPHomeNormalView *normalView = [[DPHomeNormalView alloc] init];
    self.normalView = normalView;
    [self addSubview:normalView];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"status";
    DPHomeBodyTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DPHomeBodyTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setStatusFrame:(DPHomeStatusFrame *)statusFrame {
    _statusFrame = statusFrame;

    self.normalView.normalFrame = statusFrame.normalViewFrame;    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
