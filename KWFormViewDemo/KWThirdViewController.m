//
//  KWThirdViewController.m
//  KWFormViewDemo
//
//  Created by kevin on 15/3/23.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import "KWThirdViewController.h"
#import "KWFormViewQuickBuilder.h"
#import "KWPerson.h"

@interface KWThirdViewController ()
@property (nonatomic, strong) NSArray *titles;

@end

@implementation KWThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    KWFormViewQuickBuilder *builder = [[KWFormViewQuickBuilder alloc] init];
    [builder addRecord: self.titles];
    NSArray *datas = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"datas" ofType:@"plist"]];
    NSArray *persons = [KWPerson personsWithDictArray:datas];
    [builder setBorderColor:[UIColor blackColor]];
    for (NSInteger i = 0 ; i < persons.count ; i++) {
        KWPerson *person = (KWPerson *)persons[i];
        [builder addRecord:@[person.name,person.sex,[NSString stringWithFormat:@"%ld",(long)person.age]]];
        UIColor *textColor = nil;
        UIColor *bgColor = nil;
        if (i % 3 == 0) {
            textColor = [UIColor lightGrayColor];
            bgColor = [UIColor whiteColor];
        }else if (i % 3 == 1) {
            textColor = [UIColor grayColor];
            bgColor = [UIColor lightGrayColor];
        }else{
            textColor = [UIColor whiteColor];
            bgColor = [UIColor grayColor];
        }
        [builder setTextColor:textColor backgroundColor:bgColor forRow:i + 1];
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