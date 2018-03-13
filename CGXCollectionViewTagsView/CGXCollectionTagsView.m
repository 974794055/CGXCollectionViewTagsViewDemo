//
//  CGXCollectionViewTagsView.m
//  CGXCollectionViewTagsViewDemo
//
//  Created by 曹贵鑫 on 2018/1/30.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXCollectionTagsView.h"
#define CGXCollectionViewTagScreenWidth                 [UIScreen mainScreen].bounds.size.width
#define CGXCollectionViewTagScreenHeight                [UIScreen mainScreen].bounds.size.height

#define CGXCollectionViewTagScaleHeight(A) A / (double)667 * CGXCollectionViewTagScreenHeight
#define CGXCollectionViewTagScaleWidth(W)  W / (double)375 * CGXCollectionViewTagScreenWidth

@interface CGXCollectionTagsView ()
{
    CGFloat viewW;
    CGFloat viewH;
}

@end

@implementation CGXCollectionTagsView

- (instancetype)initWithFrame:(CGRect)frame WithManager:(CGXCollectionTagsViewManager *)manager
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.manager = manager;
        
        self.backgroundColor  =self.manager.backgroundColor;
        
        viewH = frame.size.height;
        viewW = frame.size.width;
        
        [self.collectionView reloadData];
    }
    return self;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CGXCollectionViewLeftAlignedTagsFlowLayout *flowLayout = [[CGXCollectionViewLeftAlignedTagsFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, viewW, viewH) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        //注册
        [_collectionView registerClass:[CGXCollectionTagsViewCell class] forCellWithReuseIdentifier:@"CGXCollectionTagsViewCell"];
        
        //给collectionView注册头分区的Id
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
        //给collection注册脚分区的id
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerId"];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    

    CGXCollectionViewLeftAlignedTagsFlowLayout *layout = (CGXCollectionViewLeftAlignedTagsFlowLayout *)_collectionView.collectionViewLayout;
    [layout invalidateLayout];
    
    _collectionView.frame = self.bounds;
    if (!CGSizeEqualToSize(self.bounds.size, [self intrinsicContentSize])) {
        [self invalidateIntrinsicContentSize];
    }
    
    CGFloat height = _collectionView.collectionViewLayout.collectionViewContentSize.height;
    if (height != 0 && height != self.bounds.size.height) {
        CGRect frame = self.frame;
            frame.size.height = height;
            self.frame = frame;
            _collectionView.frame = self.bounds;
        // blcok返回高度
        if ([self.delegate respondsToSelector:@selector(showCGXCollectionTagsView:Height:)]) {
            [self.delegate showCGXCollectionTagsView:self Height:height];
        }
    }
        
   
}
- (CGSize)intrinsicContentSize
{
    return _collectionView.collectionViewLayout.collectionViewContentSize;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.manager.tagsArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.manager.tagsArray[section] count];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return self.manager.minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return self.manager.minimumInteritemSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(viewW, self.manager.headerSectionHeight);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(viewW, self.manager.footerSectionHeight);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return self.manager.edgeInsets;
}
#pragma mark - 显示cell的分区方法
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId" forIndexPath:indexPath];
        view.backgroundColor = self.manager.headerBackgroundColor;
        return view;
    } else {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerId" forIndexPath:indexPath];
        view.backgroundColor = self.manager.footerBackgroundColor;
        return view;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXCollectionTagsViewModel *model = self.manager.tagsArray[indexPath.section][indexPath.row];
    CGSize size = [self calculateTitleSize:model.title];
    if (self.manager.iSCustom) {
        CGXCollectionTagsViewCell *cell = (CGXCollectionTagsViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        if (self.delegate && [self.delegate respondsToSelector:@selector(showCGXCollectionTagsViewItemHeight:Model:Cell:ItemAtIndexPath:)]) {
            CGSize size = [self.delegate showCGXCollectionTagsViewItemHeight:self Model:model Cell:cell ItemAtIndexPath:indexPath];
            return size;
        }
        return CGSizeMake(ceilf(size.width)+self.manager.tagSpace,ceilf(size.height));
    }
    return CGSizeMake(ceilf(size.width)+self.manager.tagSpace,self.manager.tagHeight);
}
- (CGSize)calculateTitleSize:(NSString *)title
{
    CGSize size;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:self.manager.titleSize], NSFontAttributeName, nil];
    size = [title boundingRectWithSize:CGSizeMake(viewW-2*self.manager.minimumInteritemSpacing-self.manager.tagSpace,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return CGSizeMake(size.width, size.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXCollectionTagsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CGXCollectionTagsViewCell" forIndexPath:indexPath];
    CGXCollectionTagsViewModel *model = self.manager.tagsArray[indexPath.section][indexPath.row];
    if (self.manager.iSCustom) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(showCollectionTagsView:Model:Cell:ItemAtIndexPath:)]) {
            [self.delegate showCollectionTagsView:self Model:model Cell:cell ItemAtIndexPath:indexPath];
        }
    } else{
        if (model.titleColor) {
            cell.tagsLabel.textColor = model.titleColor;
        } else{
            cell.tagsLabel.textColor = self.manager.titleColor;
        }
        if (model.titleSize) {
            cell.tagsLabel.font = [UIFont systemFontOfSize:model.titleSize];
        } else{
            cell.tagsLabel.font = [UIFont systemFontOfSize:self.manager.titleSize];
        }
         if (model.itemColor) {
            cell.tagsLabel.backgroundColor = model.itemColor;
         }else{
            cell.tagsLabel.backgroundColor = self.manager.itemColor;
         }
        if (model.cornerRadius) {
          cell.tagsLabel.layer.cornerRadius = model.cornerRadius;
       }else{
          cell.tagsLabel.layer.cornerRadius = self.manager.cornerRadius;
       }
        if (model.borderWidth) {
          cell.tagsLabel.layer.borderWidth = model.borderWidth;
        }else{
          cell.tagsLabel.layer.borderWidth = self.manager.borderWidth;
        }
        if (model.borderColor) {
             cell.tagsLabel.layer.borderColor = model.borderColor.CGColor;
        }else{
           cell.tagsLabel.layer.borderColor = self.manager.borderColor.CGColor;
        }
        cell.tagsLabel.userInteractionEnabled = !self.manager.isUser;
        cell.tagsLabel.text = model.title;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXCollectionTagsViewModel *model = self.manager.tagsArray[indexPath.section][indexPath.row];
    CGXCollectionTagsViewCell *cell = (CGXCollectionTagsViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (self.manager.isUser) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectCollectionTagsView:Model:Cell:ItemAtIndexPath:)]) {
            [self.delegate selectCollectionTagsView:self Model:model Cell:cell ItemAtIndexPath:indexPath];
        }
    }
}
- (void)upDateCollectionView
{
    [self.collectionView reloadData];
    [self layoutIfNeeded];
    [self layoutSubviews];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
