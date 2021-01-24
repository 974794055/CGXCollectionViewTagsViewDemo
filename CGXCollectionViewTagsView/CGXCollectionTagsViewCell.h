//
//  CGXCollectionTagsViewCell.h
//  CGXCollectionViewTagsView
//
//  Created by CGX on 2017/9/28.
//  Copyright © 2017年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXCollectionTagsViewModel.h"
@interface CGXCollectionTagsViewCell : UICollectionViewCell

@property (nonatomic , strong) UILabel *tagsLabel;

- (void)updateWithModel:(CGXCollectionTagsViewModel *)model;


@end
