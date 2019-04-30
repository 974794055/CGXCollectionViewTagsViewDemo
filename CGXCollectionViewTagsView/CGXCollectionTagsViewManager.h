//
//  CGXCollectionTagsViewManager.h
//  CGXCollectionViewTagsView
//
//  Created by 曹贵鑫 on 2017/9/28.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CGXCollectionTagsViewModel.h"
typedef NS_ENUM(NSInteger, CGXCollectionTagsViewManagerStyle) {
    CGXCollectionTagsViewManagerStyleNode,
    CGXCollectionTagsViewManagerStyleNome,
};

@interface CGXCollectionTagsViewManager : NSObject

/**
 @param showStype 初始化选择类型
 @return self
 */
- (instancetype)initWithType:(CGXCollectionTagsViewManagerStyle)showStype;

/**
 图片处理功能类型
 **/
@property (nonatomic , assign) CGXCollectionTagsViewManagerStyle showStyle;

/*
-  tagsArray 格式  @[@[model,model],@[model],@[model,model]] 
 */
@property (nonatomic , strong) NSMutableArray *tagsArray;//标签数组

//@property (nonatomic , assign) BOOL isSlide;//是否支持滑动   默认不支持  为NO

@property (nonatomic , assign) BOOL iSCustom;//是否支持自定义  默认为NO

//  * 一下已废弃 ，使用CGXCollectionTagsViewModel 初始化每个item //

@property (nonatomic , assign) BOOL isUser;//是否支持点击cell   默认不支持  为NO

@property (nonatomic , strong) UIColor *backgroundColor;
@property (nonatomic,strong) UIColor *borderColor;//标签边框颜色
@property (nonatomic,assign) float borderWidth;//标签边框宽度
@property (nonatomic,assign) float cornerRadius;//标签圆角大小
@property (nonatomic,assign) float titleSize;//标签字体大小
@property (nonatomic,strong) UIColor *titleColor;//标签字体颜色
@property (nonatomic,strong) UIColor *itemColor;//标签字背景颜色


@property (nonatomic) UIEdgeInsets edgeInsets;//每个item偏移量
@property (nonatomic , assign) NSInteger minimumLineSpacing;//默认是10
@property (nonatomic , assign) NSInteger minimumInteritemSpacing;//默认是10
@property (nonatomic,assign) float tagSpace;//标签内部左右间距(标题距离边框2边的距离和)

@property (nonatomic,assign) float tagHeight;//标签高度
@property (nonatomic,assign) float headerHeight;//标签头高度
@property (nonatomic,assign) float footerHeight;//所有脚高度
@property (nonatomic,assign) float headerSectionHeight;//标签分区头高度
@property (nonatomic,assign) float footerSectionHeight;//所有分区脚高度
@property (nonatomic,strong) UIColor *headerBackgroundColor;//头背景颜色
@property (nonatomic,strong) UIColor *footerBackgroundColor;//脚背景颜色


@end
