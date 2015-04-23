//
//  KWFirstViewController.m
//  KWFormViewDemo
//
//  Created by kevin on 15/3/20.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import "KWFirstViewController.h"
#import "KWFormViewQuickBuilder.h"
#import "KWPerson.h"

@interface KWFirstViewController ()
@property (nonatomic, strong) NSArray *titles;

@end

@implementation KWFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    KWFormViewQuickBuilder *builder = [[KWFormViewQuickBuilder alloc] init];
    [builder addRecord: self.titles];
    NSArray *datas = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"datas" ofType:@"plist"]];
    NSArray *persons = [KWPerson personsWithDictArray:datas];
    for (KWPerson *person in persons) {
        [builder addRecord:@[person.name,person.sex,[NSString stringWithFormat:@"%ld",(long)person.age]]];
    }
    KWFormView *formView = [builder startCreatWithWidths:@[@(100),@(100),@(100)] startPoint:CGPointMake(10, 100)];
    [self.view addSubview:formView];
}

- (NSArray *)titles
{
    if (!_titles) {
        _titles = @[@"姓名",@"性别",@"年龄"];
    }
    return _titles;
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com