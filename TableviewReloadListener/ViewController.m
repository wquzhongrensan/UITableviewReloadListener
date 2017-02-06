//
//  ViewController.m
//  TableviewReloadListener
//
//  Created by AppsComm on 2017/2/6.
//  Copyright © 2017年 quzhongrensan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *right;
    right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshTV)];
    self.navigationItem.rightBarButtonItem = right;
    
    _tableview = ({
        UITableView *tv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tv.delegate = self;
        tv.dataSource = self;
        [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        tv;});
    [self.view addSubview:_tableview];
    
}

#pragma mark --event
//检测tableview reload完成
- (void)refreshTV{
    NSLog(@"will refresh tableview");
    [self.tableview reloadData];
    
    //method1
    [self.tableview layoutIfNeeded];
    NSLog(@"did refresh tableview");
    
    //method2
//    dispatch_async(dispatch_get_main_queue(), ^{
//         NSLog(@"did refresh tableview");
//    });
    
}

#pragma mark --delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"get num of tableviewcells");
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"row:%ld",(long)indexPath.row];
    NSLog(@"load a cell");
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
