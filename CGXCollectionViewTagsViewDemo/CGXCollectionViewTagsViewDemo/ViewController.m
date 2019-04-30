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
//    self.tagsView = [[CGXCollectionTagsView alloc] initWithFrame:CGRectMake(20, 64, self.view.frame.size.width-40, 100) WithManager:self.manager];
    
    self.tagsView = [[CGXCollectionTagsView alloc] init];
    self.tagsView.manager = self.manager;
     self.tagsView.delegate = self;
    self.tagsView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    [self.view addSubview:self.tagsView];
    self.tagsView.cellType = CGXCollectionTagsViewAlignDirectionLeft;
    self.tagsView.frame = CGRectMake(20, 64, self.view.frame.size.width-40, 100);
  
}


- (CGXCollectionTagsViewManager *)manager
{
    if (!_manager) {
        _manager = [[CGXCollectionTagsViewManager alloc] initWithType:CGXCollectionTagsViewManagerStyleNode];
        NSMutableArray *arr = [NSMutableArray array];
        
       NSArray *tagsArr= @[@"锤子",@"见过",@"膜拜单车",@"微信支付",@"QQ",@"阿珂",@"王者荣耀",@"蓝淋网",@"半生",@"猎场",@"QQ空间",@"王者荣耀助手",@"斯卡哈复健科",@"安抚",@"沙发上",@"日打的费",@"问问",@"无人区",@"阿斯废弃物人情味",@"沙发上",@"日打的费",@"问问",@"无人区",@"阿斯废弃物人情味",@"沙发上",@"日打的费",@"问问",@"无人区",@"阿斯废弃物人情味",@"沙发上",@"日打的费",@"问问",@"无人区",@"阿斯废弃物人情味"];
        
        for (int i = 0; i<tagsArr.count; i++) {
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
    
            UIColor *color = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
            NSDictionary *dict = @{@"title":tagsArr[i],
                                   @"tagsDic":@{@"tags":@"12"},
                                   @"itemColor":color
                                   };
            [arr addObject:dict];
        }
        NSMutableArray *arrDAta = [NSMutableArray array];
        for (int i = 0; i<arr.count; i++) {
                CGXCollectionTagsViewModel *model =[CGXCollectionTagsViewModel new];
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            
            UIColor *color = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
            model.itemColor =  color;
                [model setValuesForKeysWithDictionary:arr[i]];
                [arrDAta addObject:model];
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
//    cell.tagsLabel.textColor = self.manager.titleColor;
//    cell.tagsLabel.font = [UIFont systemFontOfSize:self.manager.titleSize];
//    cell.tagsLabel.backgroundColor = self.manager.itemColor;
//    cell.tagsLabel.text = model.title;
//    cell.tagsLabel.textAlignment =NSTextAlignmentCenter;
//    cell.tagsLabel.layer.cornerRadius = self.manager.cornerRadius;
//    cell.tagsLabel.layer.masksToBounds = YES;
//    cell.tagsLabel.layer.borderWidth = self.manager.borderWidth;
//    cell.tagsLabel.layer.borderColor = self.manager.borderColor.CGColor;
//    cell.tagsLabel.userInteractionEnabled = !self.manager.isUser;
}
- (CGSize)showCGXCollectionTagsViewItemHeight:(CGXCollectionTagsView *)tagsView Model:(CGXCollectionTagsViewModel *)model Cell:(CGXCollectionTagsViewCell *)cell ItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row %2 ==0){
        return CGSizeMake(150, 50);
    }else{
        return CGSizeMake(100, 50);
    }
    return CGSizeMake(150, 50);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
