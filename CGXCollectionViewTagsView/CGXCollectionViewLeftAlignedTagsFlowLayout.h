//
//  CGXCollectionViewLeftAlignedTagsFlowLayout.h
//  CGXCollectionViewTagsView
//
//  Created by 曹贵鑫 on 2017/9/28.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CGXCustomStateTagsAlignFlowLayoutAlignType){
    CGXCustomStateTagsAlignFlowLayoutAlignWithLeft,
    CGXCustomStateTagsAlignFlowLayoutAlignWithCenter,
    CGXCustomStateTagsAlignFlowLayoutAlignWithRight
};

@interface CGXCollectionViewLeftAlignedTagsFlowLayout : UICollectionViewFlowLayout
//cell对齐方式
@property (nonatomic,assign) CGXCustomStateTagsAlignFlowLayoutAlignType cellType;

-(instancetype)initWthType : ( CGXCustomStateTagsAlignFlowLayoutAlignType)cellType;
//全能初始化方法 其他方式初始化最终都会�走到这里
-(instancetype)initWithType:( CGXCustomStateTagsAlignFlowLayoutAlignType) cellType betweenOfCell:(CGFloat)betweenOfCell;
@end

@protocol UICollectionViewDelegateLeftAlignedLayout <UICollectionViewDelegateFlowLayout>

@end
