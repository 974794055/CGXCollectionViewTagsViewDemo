//
//  CGXCollectionViewTagsView.h
//  CGXCollectionViewTagsViewDemo
//
//  Created by 曹贵鑫 on 2018/1/30.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXCollectionViewLeftAlignedTagsFlowLayout.h"
//#import "CGXCollectionTagsViewModel.h"
#import "CGXCollectionTagsViewManager.h"
//#import "CGXCollectionTagsView.h"
//#import "CGXCollectionTagsViewCell.h"
@interface CGXCollectionViewTagsView : UIView

- (instancetype)initWithFrame:(CGRect)frame WithManager:(CGXCollectionTagsViewManager *)manager;

@property (nonatomic , strong) CGXCollectionTagsViewManager *manager;//配置

@end
