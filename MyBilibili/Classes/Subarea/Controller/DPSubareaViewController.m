//
//  DPSubareaTableViewController.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/24.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPSubareaViewController.h"

#import "DPRegion.h"
#import "DPRegionCollectionCell.h"

@interface DPSubareaViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) NSArray *regions;

@end

@implementation DPSubareaViewController
static NSString *const cellId = @"cellId";

#pragma mark - lazy
- (NSArray *)regions
{
    if(!_regions){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"region.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        
        // 将转换后的数据传递给regions
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            DPRegion *region = [DPRegion RegionWithDict:dict];
            [models addObject:region];
        }
        _regions = models;
        
    }
    return _regions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"分区";
    // 创建一个CollectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(75, 75);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, DPScreenWidth, DPScreenHeight) collectionViewLayout:layout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = DPColor(241, 241, 241);
    [collectionView registerClass:[DPRegionCollectionCell class] forCellWithReuseIdentifier:cellId];
    [self.view addSubview:collectionView];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.regions.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DPRegionCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.region = self.regions[indexPath.item];
    return cell;
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
