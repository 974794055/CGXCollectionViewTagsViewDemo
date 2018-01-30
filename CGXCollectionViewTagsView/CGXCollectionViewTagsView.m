//
//  CGXCollectionViewTagsView.m
//  CGXCollectionViewTagsViewDemo
//
//  Created by 曹贵鑫 on 2018/1/30.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXCollectionViewTagsView.h"

@implementation CGXCollectionViewTagsView

- (instancetype)initWithFrame:(CGRect)frame WithManager:(CGXCollectionTagsViewManager *)manager
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.manager = manager;
        
        self.backgroundColor  =self.manager.backgroundColor;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
