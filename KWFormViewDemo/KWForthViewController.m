//
//  KWForthViewController.m
//  KWFormViewDemo
//
//  Created by kevin on 15/3/23.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import "KWForthViewController.h"
#import "KWFormView.h"
#import "KWPerson.h"

@interface KWForthViewController () <KWFormViewDataSource,KWFormViewDelegate>
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation KWForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *datas = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"datas" ofType:@"plist"]];
    self.datas = [KWPerson personsWithDictArray:datas];
    self.titles = @[@"姓名",@"性别",@"年龄"];
    KWFormView *formView = [[KWFormView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 0)];
    formView.delegate = self;
    formView.dataSource = self;
    [self.view addSubview:formView];
}

#pragma mark - formView dataSource
- (NSInteger)numberOfRowsInFormView:(KWFormView *)formView
{
    return self.datas.count + 1;
}

- (NSInteger)formViewColumnsInRow:(KWFormView *)formView
{
    return 3;
}

- (NSString *)formView:(KWFormView *)formView textForColumn:(NSInteger)column inRow:(NSInteger)row
{
    if (!row) {
        return self.titles[column];
    }else{
        KWPerson *person = self.datas[row - 1];
        if (column == 0) {
            return person.name;
        }else if (column == 1) {
            return person.sex;
        }else{
            return [NSString stringWithFormat:@"%ld",(long)person.age];
        }
    }
}

- (UIColor *)formView:(KWFormView *)formView colorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    if (row == 0) {
        return [UIColor blackColor];
    }
    if (column == 1) {
        if (row % 2) {
            return [UIColor lightGrayColor];
        }
        return [UIColor grayColor];
    }else{
        if (row % 2) {
            return [UIColor grayColor];
        }
        return [UIColor lightGrayColor];
    }
}

- (UIColor *)formView:(KWFormView *)formView contentColorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    return [UIColor whiteColor];
}

- (UIColor *)formViewBorderColor:(KWFormView *)formView
{
    return [UIColor blackColor];
}

- (CGFloat)formView:(KWFormView *)formView widthForColumn:(NSInteger)column
{
    return formView.bounds.size.width / 3.f;
}

- (CGFloat)formView:(KWFormView *)formView heightForRow:(NSInteger)row
{
    return 20;
}

- (BOOL)formView:(KWFormView *)formView addActionForColumn:(NSInteger)column inRow:(NSInteger)row
{
    return YES;
}

- (void)formView:(KWFormView *)formView didSelectColumn:(NSInteger)column inRow:(NSInteger)row
{
    NSLog(@"%@",[formView itemAtColumn:column inRow:row].currentTitle);
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com