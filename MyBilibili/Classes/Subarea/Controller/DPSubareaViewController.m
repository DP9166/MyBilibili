//
//  DPSubareaTableViewController.m
//  MyBilibili
//
//  Created by 段沛 on 16/8/24.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DPSubareaViewController.h"

@interface DPSubareaViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) NSMutableArray *arrays;

@end

@implementation DPSubareaViewController

static NSString *const cellId = @"cellId";

#pragma mark - lazy 
- (NSMutableArray *)arrays
{
    if(!_arrays){
        self.arrays = [[NSMutableArray alloc] init];
        
    }
    return _arrays;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"分区";
    self.view.backgroundColor = DPColor(239, 239, 239);
    
    // 创建一个CollectionView
    UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, DPScreenWidth, DPScreenHeight) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [self.view addSubview:collectionView];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 14;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
