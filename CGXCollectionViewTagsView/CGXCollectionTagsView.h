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

typedef NS_ENUM(NSInteger, CGXCollectionTagsViewAlignFlowLayoutAlignType){
    CGXCollectionTagsViewAlignFlowLayoutAlignWithLeft,
    CGXCollectionTagsViewAlignFlowLayoutAlignWithCenter,
    CGXCollectionTagsViewAlignFlowLayoutAlignWithRight
};

//点击block
typedef void(^CGXCollectionTagsViewSelectBlock)(CGXCollectionTagsView *tagsView,CGXCollectionTagsViewModel *tagModel,CGXCollectionTagsViewCell *cell,NSIndexPath *indexPath);
//展示block
typedef void(^CGXCollectionTagsViewCellForItemBlock)(CGXCollectionTagsView *tagsView,CGXCollectionTagsViewModel *tagModel,CGXCollectionTagsViewCell *cell,NSIndexPath *indexPath);
//返回高度
typedef void(^CGXCollectionTagsViewHeightBlock)(CGXCollectionTagsView *tagsView,CGFloat height);

@protocol CGXCollectionTagsViewDelegate;

@interface CGXCollectionTagsView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//可不使用此初始化方式
- (instancetype)initWithFrame:(CGRect)frame WithManager:(CGXCollectionTagsViewManager *)manager;

@property(nonatomic,weak)id <CGXCollectionTagsViewDelegate>delegate;

@property (nonatomic , strong) CGXCollectionTagsViewManager *manager;//配置

//cell对齐方式
@property (nonatomic,assign) CGXCollectionTagsViewAlignFlowLayoutAlignType cellType;
// 是否是自适应高度 默认YES
@property (nonatomic,assign) BOOL isAdaptive;

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,copy) CGXCollectionTagsViewSelectBlock selectBlock;
@property (nonatomic,copy) CGXCollectionTagsViewCellForItemBlock cellForItemBlock;
@property (nonatomic,copy) CGXCollectionTagsViewHeightBlock heightBlock;

@end


@protocol CGXCollectionTagsViewDelegate <NSObject>
@optional
///点击标签
- (void)selectCollectionTagsView:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath;
///展示标签
- (void)showCollectionTagsView:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath;
//返回标签的高度
- (CGFloat)showCGXCollectionTagsView:(CGXCollectionTagsView *)tagsView Height:(CGFloat)myHeight;
//
- (CGSize)showCGXCollectionTagsViewItemHeight:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath;;
@end
