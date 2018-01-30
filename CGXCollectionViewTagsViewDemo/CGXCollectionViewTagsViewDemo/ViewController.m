//
//  ViewController.m
//  CGXCollectionViewTagsViewDemo
//
//  Created by 曹贵鑫 on 2018/1/30.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "ViewController.h"
#import "CGXCollectionTagsView.h"
#import "CGXCollectionTagsViewManager.h"
#import "CGXCollectionTagsViewModel.h"
@interface ViewController ()<CGXCollectionTagsViewDelegate>

@property (nonatomic , strong) CGXCollectionTagsView *tagsView;
@property (nonatomic , strong) CGXCollectionTagsViewManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tagsView = [[CGXCollectionTagsView alloc] initWithFrame:CGRectMake(20, 64, self.view.frame.size.width-40, 0) WithManager:self.manager];
    self.tagsView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    [self.view addSubview:self.tagsView];
   self.tagsView.delegate = self;
}


- (CGXCollectionTagsViewManager *)manager
{
    if (!_manager) {
        _manager = [[CGXCollectionTagsViewManager alloc] initWithType:CGXCollectionTagsViewManagerStyleNode];
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            NSDictionary *dict = @{@"title":[NSString stringWithFormat:@"添加%d",i]};
            [arr addObject:dict];
        }
        NSMutableArray *arrDAta = [NSMutableArray array];
        for (int i = 0; i<arr.count; i++) {
            if (i <12) {
                CGXCollectionTagsViewModel *model =[CGXCollectionTagsViewModel new];
                [model setValuesForKeysWithDictionary:arr[i]];
                [arrDAta addObject:model];
            }
        }
        _manager.isUser = YES;
//                _manager.iSCustom = YES;
        _manager.tagsArray = [NSMutableArray arrayWithObjects:arrDAta, nil];
    }
    return _manager;
}

- (void)selectCollectionTagsView:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select:%@-%@-%@-%@" , tagsView,model,cell,indexPath);
}
- (void)showCollectionTagsView:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell:%@-%@-%@-%@" , tagsView,model,cell,indexPath);
    cell.tagsLabel.textColor = self.manager.titleColor;
    cell.tagsLabel.font = [UIFont systemFontOfSize:self.manager.titleSize];
    cell.tagsLabel.backgroundColor = self.manager.itemColor;
    cell.tagsLabel.text = model.title;
    cell.tagsLabel.textAlignment =NSTextAlignmentCenter;
    cell.tagsLabel.layer.cornerRadius = self.manager.cornerRadius;
    cell.tagsLabel.layer.masksToBounds = YES;
    cell.tagsLabel.layer.borderWidth = self.manager.borderWidth;
    cell.tagsLabel.layer.borderColor = self.manager.borderColor.CGColor;
    cell.tagsLabel.userInteractionEnabled = !self.manager.isUser;
}
- (CGSize)showCGXCollectionTagsViewItemHeight:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 50);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
