//
//  ViewController.m
//  KWFormViewDemo
//
//  Created by kevin on 15/3/17.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import "ViewController.h"
#import "KWFirstViewController.h"
#import "KWSecondViewController.h"
#import "KWThirdViewController.h"
#import "KWForthViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *subTitles;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.subTitles = @[@"QuickBuilder 默认样式",@"QuickBuilder 为第一、第三列加事件",@"QuickBuilder 自定义颜色",@"FromView 自定义样式"];
    [self.tableView reloadData];
}


# pragma mark - tableView dataSource & delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个",indexPath.row + 1];
    cell.detailTextLabel.text = self.subTitles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = nil;
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        viewController = [[KWFirstViewController alloc] init];
    }else if (indexPath.row == 1) {
        viewController = [[KWSecondViewController alloc] init];
    }else if (indexPath.row == 2) {
        viewController = [[KWThirdViewController alloc] init];
    }else if (indexPath.row == 3) {
        viewController = [[KWForthViewController alloc] init];
    }
    viewController.title = self.subTitles[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com