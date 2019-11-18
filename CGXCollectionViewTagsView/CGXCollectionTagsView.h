//
//  CGXCollectionViewTagsView.h
//  CGXCollectionViewTagsViewDemo
//
//  Created by 曹贵鑫 on 2018/1/30.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//
/*

下载链接：https://github.com/974794055/CGXCollectionViewTagsViewDemo.git
QQ号：974794055
群名称：
CGXCollectionTagsView交流群
群   号：
版本： 1.2.0
*/


#import <UIKit/UIKit.h>

#import "CGXCollectionTagsViewModel.h"
#import "CGXCollectionTagsViewManager.h"
#import "CGXCollectionTagsViewCell.h"



typedef NS_ENUM(NSInteger, CGXCollectionTagsViewAlignDirectionType){
    CGXCollectionTagsViewAlignDirectionLeft,
    CGXCollectionTagsViewAlignDirectionCenter,
    CGXCollectionTagsViewAlignDirectionRight
};

@class CGXCollectionTagsView;

//点击block
typedef void(^CGXCollectionTagsViewSelectBlock)(CGXCollectionTagsView *tagsView,CGXCollectionTagsViewModel *tagModel,CGXCollectionTagsViewCell *cell,NSIndexPath *indexPath);
//展示block
typedef void(^CGXCollectionTagsViewCellForItemBlock)(CGXCollectionTagsView *tagsView,CGXCollectionTagsViewModel *tagModel,CGXCollectionTagsViewCell *cell,NSIndexPath *indexPath);
//返回高度
typedef void(^CGXCollectionTagsViewHeightBlock)(CGXCollectionTagsView *tagsView,CGFloat height);

@protocol CGXCollectionTagsViewDelegate;

@interface CGXCollectionTagsView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//可不使用此初始化方式  给个默认高度
- (instancetype)initWithFrame:(CGRect)frame WithManager:(CGXCollectionTagsViewManager *)manager;

@property(nonatomic,weak)id <CGXCollectionTagsViewDelegate>delegate;

@property (nonatomic , strong) CGXCollectionTagsViewManager *manager;//配置

//cell对齐方式
@property (nonatomic,assign) CGXCollectionTagsViewAlignDirectionType cellType;
// 是否是自适应高度 默认YES
@property (nonatomic,assign) BOOL isAdaptive;

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,copy) CGXCollectionTagsViewSelectBlock selectBlock;
@property (nonatomic,copy) CGXCollectionTagsViewCellForItemBlock cellForItemBlock;
@property (nonatomic,copy) CGXCollectionTagsViewHeightBlock heightBlock;


/*
-  tagsArray 格式  @[@[model,model],@[model],@[model,model]]
 */
@property (nonatomic , strong) NSMutableArray<NSMutableArray<CGXCollectionTagsViewModel *> *> *tagsArray;//标签数组

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
