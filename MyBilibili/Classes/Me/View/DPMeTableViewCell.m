//
//  DPMeTableViewCell.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/26.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPMeTableViewCell.h"
#import "DPGroupItem.h"
#import "DPItem.h"


@interface DPMeTableViewCell()

@property (nonatomic,strong) UILabel *groupsLabel;
@property (nonatomic,strong) UIView *detailView;
@property (nonatomic,strong) UIButton *itemsBtn;
@end

@implementation DPMeTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"status";
    DPMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DPMeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 改变cell样式
        [self initSubView];
        
    }
    return self;
}

- (void)initSubView {
    UILabel *groupsLabel = [[UILabel alloc] init];
    groupsLabel.font = [UIFont systemFontOfSize:14];
    self.groupsLabel = groupsLabel;
    [self.contentView addSubview:groupsLabel];
    
    UIView *detailView = [[UIView alloc] init];
    self.detailView = detailView;
    [self.contentView addSubview:detailView];
    
    
    for (NSUInteger i = 0; i < 8 ; i++) {
        UIButton *itemsBtn = [[UIButton alloc] init];
        [itemsBtn.layer setMasksToBounds:YES];
        [itemsBtn.layer setBorderWidth:0.67];
        itemsBtn.layer.borderColor = DPColor(238, 238, 238).CGColor;
    
        [detailView addSubview:itemsBtn];
        
        UIImageView *topImgView = [[UIImageView alloc] init];
        topImgView.contentMode =  UIViewContentModeBottom;
        [itemsBtn addSubview:topImgView];
        
        
        UILabel *bottomTitleLabel = [[UILabel alloc] init];
        bottomTitleLabel.font = [UIFont systemFontOfSize:11];
        bottomTitleLabel.textAlignment = NSTextAlignmentCenter;
        [itemsBtn addSubview:bottomTitleLabel];
    }
}

- (void)setGroupItems:(DPGroupItem *)groupItems {
    _groupItems = groupItems;

    
    self.groupsLabel.text = groupItems.title;
    self.groupsLabel.frame = CGRectMake(10, 0, DPScreenWidth, 40);
    
    self.detailView.frame = CGRectMake(0, CGRectGetMaxY(self.groupsLabel.frame), DPScreenWidth, 130);
    
    
    for (NSUInteger i = 0; i <self.detailView.subviews.count ; i++) {

        UIButton *itemsBtn = self.detailView.subviews[i];
        
        itemsBtn.width = DPScreenWidth * 0.25;
        itemsBtn.height = itemsBtn.width;
        itemsBtn.x = itemsBtn.width *(i%4);
        itemsBtn.y = itemsBtn.height *(i/4);
        
        
        UIImageView *topImgView = [itemsBtn.subviews firstObject];
        topImgView.x = 0;
        topImgView.y = 0;
        topImgView.width = itemsBtn.width;
        topImgView.height = itemsBtn.height * 0.65;
        
        UILabel *bottomTitleLabel = [itemsBtn.subviews lastObject];
        bottomTitleLabel.x = topImgView.x;
        bottomTitleLabel.width = topImgView.width;
        bottomTitleLabel.y = CGRectGetMaxY(topImgView.frame);
        bottomTitleLabel.height = itemsBtn.height - topImgView.height;
        
        
        
        if (i < groupItems.items.count) {
            DPItem *items = groupItems.items[i];
        
            [topImgView setImage:[UIImage imageNamed:items.imageName]];
            bottomTitleLabel.text = items.title;
        } else {
            topImgView.image = NULL;
            bottomTitleLabel.text = NULL;
        }
        
        
    }

    
}


@end
