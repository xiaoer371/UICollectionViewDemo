//
//  LayoutTest.h
//  UICollectionViewDemo
//
//  Created by lxj on 15/1/25.
//  Copyright (c) 2015年 lxj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LayoutTest;

@protocol LayoutTestDelegate <NSObject>

@required
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(LayoutTest*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath;

@end

@interface LayoutTest : UICollectionViewLayout

@property (nonatomic, assign) NSUInteger numberOfColumns;    //  这里的变量用来决定宽度 （高度当然由数据源提供）
@property (nonatomic, assign) CGFloat interItemSpacing;
@property (weak, nonatomic) id<LayoutTestDelegate> delegate;


@end
