//
//  CGXCollectionTagsViewModel.h
//  CGXCollectionViewTagsView
//
//  Created by 曹贵鑫 on 2017/9/28.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CGXCollectionTagsViewModel : NSObject

/**
 标签标题
 */
@property (nonatomic,strong)NSString *title;

@property (nonatomic,strong) UIColor *borderColor;//标签边框颜色
@property (nonatomic,assign) CGFloat borderWidth;//标签边框宽度
@property (nonatomic,assign) CGFloat cornerRadius;//标签圆角大小

@property (nonatomic,assign) UIFont *titleSize;//标签字体大小
@property (nonatomic,strong) UIColor *titleColor;//标签字体颜色
@property (nonatomic,strong) UIColor *itemColor;//标签字背景颜色

@property (nonatomic , assign) BOOL isUser;//是否支持点击cell   默认不支持  为NO

/**
 元素数据源字典
 */
@property (nonatomic,strong)NSString *tagsDic;

//元素数据源
@property (nonatomic,strong)id dateModel;


@end
