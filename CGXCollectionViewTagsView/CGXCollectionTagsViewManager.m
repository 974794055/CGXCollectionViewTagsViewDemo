//
//  CGXCollectionTagsViewManager.m
//  CGXCollectionViewTagsView
//
//  Created by 曹贵鑫 on 2017/9/28.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXCollectionTagsViewManager.h"
#define CGXCollectionViewTagScreenWidth                 [UIScreen mainScreen].bounds.size.width
#define CGXCollectionViewTagScreenHeight                [UIScreen mainScreen].bounds.size.height

#define CGXCollectionViewTagScaleHeight(A) A / (double)667 * CGXCollectionViewTagScreenHeight
#define CGXCollectionViewTagScaleWidth(W)  W / (double)375 * CGXCollectionViewTagScreenWidth
@implementation CGXCollectionTagsViewManager

- (instancetype)initWithType:(CGXCollectionTagsViewManagerStyle)showStype
{
    if (self = [super init]) {
        self.showStyle = showStype;
        
        [self setUpManager];
    }
    return self;
}
- (void)setUpManager
{
  
    self.tagsArray = [NSMutableArray array];
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.isUser = NO;

    self.isSlide  =NO;
    self.iSCustom = NO;
    self.borderColor = [UIColor colorWithWhite:0.93 alpha:1];
    self.borderWidth = 1.5;
    self.cornerRadius = 4;
    
    
    self.minimumLineSpacing = CGXCollectionViewTagScaleWidth(10);
    self.minimumInteritemSpacing = CGXCollectionViewTagScaleWidth(10);
    self.titleSize = 14;
    self.titleColor = [UIColor redColor];
    self.itemColor = [UIColor whiteColor];
    
    
    self.tagHeight = CGXCollectionViewTagScaleWidth(40);
    self.headerHeight = 0;
    self.footerHeight = CGXCollectionViewTagScaleWidth(10);
    self.headerSectionHeight = 0;
    self.footerSectionHeight = 0;
    self.headerBackgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    self.footerBackgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    
    self.tagSpace = CGXCollectionViewTagScaleWidth(10);
    self.edgeInsets = UIEdgeInsetsMake(CGXCollectionViewTagScaleWidth(10), CGXCollectionViewTagScaleWidth(10), CGXCollectionViewTagScaleWidth(10), CGXCollectionViewTagScaleWidth(10));
}
@end
