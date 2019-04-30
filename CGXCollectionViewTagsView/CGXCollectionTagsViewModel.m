//
//  CGXCollectionTagsViewModel.m
//  CGXCollectionViewTagsView
//
//  Created by 曹贵鑫 on 2017/9/28.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXCollectionTagsViewModel.h"

@implementation CGXCollectionTagsViewModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.borderColor =[UIColor colorWithWhite:0.93 alpha:1];
        self.borderWidth = 1;
        self.cornerRadius = 4;
        self.titleSize = [UIFont systemFontOfSize:14];
        self.titleColor = [UIColor colorWithWhite:0.93 alpha:1];
        self.itemColor = [UIColor colorWithWhite:0.93 alpha:1];
        self.isUser = NO;
    }
    return self;
}
@end
