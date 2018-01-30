//
//  CGXCollectionViewTagsView.h
//  CGXCollectionViewTagsViewDemo
//
//  Created by 曹贵鑫 on 2018/1/30.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXCollectionViewLeftAlignedTagsFlowLayout.h"
#import "CGXCollectionTagsViewModel.h"
#import "CGXCollectionTagsViewManager.h"
@class CGXCollectionTagsView;
#import "CGXCollectionTagsViewCell.h"

@protocol CGXCollectionTagsViewDelegate;

@interface CGXCollectionTagsView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

- (instancetype)initWithFrame:(CGRect)frame WithManager:(CGXCollectionTagsViewManager *)manager;

@property(nonatomic,weak)id <CGXCollectionTagsViewDelegate>delegate;

@property (nonatomic , strong) CGXCollectionTagsViewManager *manager;//配置

@property (nonatomic,strong)UICollectionView *collectionView;

@end


@protocol CGXCollectionTagsViewDelegate <NSObject>
@optional
///点击标签
- (void)selectCollectionTagsView:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath;
///展示标签
- (void)showCollectionTagsView:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath;
//返回标签的高度
- (CGFloat)showCGXCollectionTagsView:(CGXCollectionTagsView *)tagsView Height:(CGFloat)myHeight;

- (CGSize)showCGXCollectionTagsViewItemHeight:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath;;
@end
