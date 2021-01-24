//
//  CGXCollectionTagsViewLayout.h
//  CGXCollectionViewTagsView
//
//  Created by CGX on 2017/9/28.
//  Copyright © 2017年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CGXCollectionTagsViewLayoutAlignType){
    CGXCollectionTagsViewLayoutAlignTypeLeft,
    CGXCollectionTagsViewLayoutAlignTypeCenter,
    CGXCollectionTagsViewLayoutAlignTypeRight
};

@interface CGXCollectionTagsViewLayout : UICollectionViewFlowLayout
//cell对齐方式
@property (nonatomic,assign) CGXCollectionTagsViewLayoutAlignType cellType;
//全能初始化方法 其他方式初始化最终都会�走到这里
-(instancetype)initWthType:(CGXCollectionTagsViewLayoutAlignType)cellType;

@end

@protocol CGXCollectionTagsViewLayoutDelegate <UICollectionViewDelegateFlowLayout>

@end
