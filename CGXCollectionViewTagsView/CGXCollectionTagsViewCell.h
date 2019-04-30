//
//  CGXCollectionTagsViewCell.h
//  CGXCollectionViewTagsView
//
//  Created by 曹贵鑫 on 2017/9/28.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXCollectionTagsViewModel.h"
@interface CGXCollectionTagsViewCell : UICollectionViewCell

@property (nonatomic , strong) UILabel *tagsLabel;

- (void)updateWithModel:(CGXCollectionTagsViewModel *)model;


@end
