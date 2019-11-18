//
//  CGXCollectionViewLeftAlignedTagsFlowLayout.h
//  CGXCollectionViewTagsView
//
//  Created by 曹贵鑫 on 2017/9/28.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CGXCollectionTagsViewAlignedFlowLayoutAlignType){
    CGXCollectionTagsViewAlignedFlowLayoutAlignTypeLeft,
    CGXCollectionTagsViewAlignedFlowLayoutAlignTypeCenter,
    CGXCollectionTagsViewAlignedFlowLayoutAlignTypeRight
};

@interface CGXCollectionTagsViewAlignedFlowLayout : UICollectionViewFlowLayout
//cell对齐方式
@property (nonatomic,assign) CGXCollectionTagsViewAlignedFlowLayoutAlignType cellType;
//全能初始化方法 其他方式初始化最终都会�走到这里
-(instancetype)initWthType:(CGXCollectionTagsViewAlignedFlowLayoutAlignType)cellType;

@end

@protocol CGXCollectionTagsViewAlignedFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>

@end
