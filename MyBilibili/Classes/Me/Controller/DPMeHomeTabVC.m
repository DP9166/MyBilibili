//
//  DPMeHomeTabVC.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/26.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPMeHomeTabVC.h"
#import "DPMeTableViewCell.h"

#import "DPGroupItem.h"
#import "DPItem.h"

@interface DPMeHomeTabVC ()

@property (strong, nonatomic) NSArray *groups;
@end

@implementation DPMeHomeTabVC

#pragma mark - lazy
- (NSArray *)groups
{
    if(!_groups){
        self.groups = [[NSArray alloc] init];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = DPColor(241, 241, 241);
    
    
    DPGroupItem *group1 = [[DPGroupItem alloc] init];
    group1.title = @"个人中心";
    group1.items = @[
                     [DPItem itemWithTitle:@"离线缓存" imageName:@"mine_download"],
                     [DPItem itemWithTitle:@"历史记录" imageName:@"mine_history"],
                     [DPItem itemWithTitle:@"我的收藏" imageName:@"mine_favourite"],
                     [DPItem itemWithTitle:@"我的关注" imageName:@"mine_follow"],
                     [DPItem itemWithTitle:@"我的钱包" imageName:@"mine_pocketcenter"],
                     [DPItem itemWithTitle:@"游戏中心" imageName:@"mine_gamecenter"],
                     [DPItem itemWithTitle:@"主题选择" imageName:@"mine_theme"]
                     ];
    
    DPGroupItem *group2 = [[DPGroupItem alloc] init];
    group2.title = @"我的消息";
    group2.items = @[
                     [DPItem itemWithTitle:@"回复我的" imageName:@"mine_answerMessage"],
                     [DPItem itemWithTitle:@"@我" imageName:@"mine_shakeMe"],
                     [DPItem itemWithTitle:@"收到的赞" imageName:@"mine_gotPrise"],
                     [DPItem itemWithTitle:@"私信" imageName:@"mine_privateMessage"],
                     [DPItem itemWithTitle:@"系统通知" imageName:@"mine_systemNotification"],
                     ];
    
    
    self.groups = @[group1,group2];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DPMeTableViewCell *cell = [DPMeTableViewCell cellWithTableView:tableView];
    
    DPGroupItem *groups = self.groups[indexPath.item];
    
    cell.groupItems = groups;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


@end
