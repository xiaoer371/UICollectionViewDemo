//
//  CollectionViewController.m
//  UICollectionViewDemo
//
//  Created by lxj on 15/1/25.
//  Copyright (c) 2015年 lxj. All rights reserved.
//

#import "CollectionViewController.h"
#import "LayoutTest.h"
#import "CollectionViewCell.h"

static NSString *CellIdentifier = @"Cell";


@interface CollectionViewController ()<LayoutTestDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UIBarPositioningDelegate>
{
    
}
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.collectionViewLayout =[[LayoutTest alloc] init];
//    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    static NSString *CellIdentifier = @"Cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                           forIndexPath:indexPath];
    cell.backgroundColor =[UIColor redColor];
    cell.imageView.image =self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat randomHeight = 100 + (arc4random() % 140);
    
//    UIImage *image = (UIImage*)self.dataArray[indexPath.row];
    return CGSizeMake(100, randomHeight);
    // 100 to 240 pixels tall
}
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(LayoutTest*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath {
    
    // we will use a random height from 100 - 400
    
    CGFloat randomHeight = 100 + (arc4random() % 140);
//    UIImage *image = (UIImage*)self.dataArray[indexPath.row];

    return randomHeight;
}

#pragma mark - pravite

-(NSMutableArray*)dataArray
{
    if (!_dataArray)
    {
        _dataArray=[[NSMutableArray alloc] initWithCapacity:0];
        
        for (int i=0; i<25; i++)
        {
            
            UIImage *image =[UIImage imageNamed:[NSString stringWithFormat:@"IMG_0%d.jpg",i+1]];
            [_dataArray addObject:image];
        }
        
    }
    return _dataArray;
}

@end
