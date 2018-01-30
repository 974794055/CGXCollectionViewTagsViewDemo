//
//  ViewController.m
//  CGXCollectionViewTagsViewDemo
//
//  Created by 曹贵鑫 on 2018/1/30.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "ViewController.h"
#import "CGXCollectionViewTagsView.h"
#import "CGXCollectionTagsViewManager.h"
#import "CGXCollectionTagsViewModel.h"
@interface ViewController ()

@property (nonatomic , strong) CGXCollectionViewTagsView *tagsView;
@property (nonatomic , strong) CGXCollectionTagsViewManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tagsView = [[CGXCollectionViewTagsView alloc] initWithFrame:CGRectMake(20, 64, self.view.frame.size.width-40, 0) WithManager:self.manager];
    self.tagsView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    [self.view addSubview:self.tagsView];

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
        //        _manager.iSCustom = YES;
        _manager.tagsArray = [NSMutableArray arrayWithObjects:arrDAta, nil];
    }
    return _manager;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
