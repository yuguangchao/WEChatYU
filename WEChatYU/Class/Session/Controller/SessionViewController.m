//
//  SessionViewController.m
//  WEChatYU
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 apple. All rights reserved.
//会话

#import "SessionViewController.h"

@interface SessionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray* sessionList;//数据源数组
@property (nonatomic,strong) UITableView *sessionTableView;
@end

@implementation SessionViewController
static NSString * const sessionCellID = @"sessionCellID";
//懒加载
- (NSMutableArray *)sessionList{
    if (!_sessionList) {
        _sessionList = [NSMutableArray array];
    }
    return _sessionList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)setupTableView{
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.sessionTableView = tableView;
    [self.view addSubview:tableView];
}

@end
