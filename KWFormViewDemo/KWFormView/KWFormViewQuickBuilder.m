//
//  KWFormViewQuickBuilder.m
//  KWFormViewDemo
//
//  Created by kevin on 15/3/18.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import "KWFormViewQuickBuilder.h"

NSString *const noAction = @"no_action";
NSString *const noColor = @"no_color";

@interface KWFormViewQuickBuilder () <KWFormViewDataSource,KWFormViewDelegate>
@property (nonatomic, strong) KWFormView *formView;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) NSMutableArray *records;
@property (nonatomic, strong) NSMutableArray *actions;
@property (nonatomic, strong) NSMutableArray *bgColors;
@property (nonatomic, strong) NSMutableArray *textColors;
@property (nonatomic, strong) NSMutableArray *widths;
@property (nonatomic, strong) id target;
@end

@implementation KWFormViewQuickBuilder

- (KWFormView *)formView
{
    if (!_formView) {
        _formView = [[KWFormView alloc] init];
        _formView.dataSource = self;
        _formView.delegate = self;
    }
    return _formView;
}

- (KWFormView *)startCreatWithWidths:(NSArray *)widths startPoint:(CGPoint)point
{
    self.widths = [widths mutableCopy];
    self.formView.frame = CGRectOffset(self.formView.frame, point.x, point.y);
    return self.formView;
}

- (void)setTextColor:(UIColor *)tcolor backgroundColor:(UIColor *)bcolor forRow:(NSInteger)row
{
    NSString *info = [NSString stringWithFormat:@"您操作的第%ld行不存在，目前有%lu行",(long)row ,(unsigned long)self.records.count];
    NSAssert(row < self.records.count, info);
    
    if (!self.textColors) {
        self.textColors = [@[] mutableCopy];
        self.bgColors = [@[] mutableCopy];
    }
    if (row == self.textColors.count) { // 1   1
        [self.textColors addObject:tcolor];
    }else if (row > self.textColors.count) { // 2  1
        NSInteger margin = row - self.textColors.count;
        for (NSInteger i = 0; i < margin; i++) {
            [self.textColors addObject:noColor];
        }
        [self.textColors addObject:tcolor];
    }else{
        [self.textColors replaceObjectAtIndex:row withObject:tcolor];
    }
    
    if (row == self.bgColors.count) {
        [self.bgColors addObject:bcolor];
    }else if (row > self.bgColors.count) {
        NSInteger margin = row - self.bgColors.count;
        for (NSInteger i = 0; i < margin; i++) {
            [self.bgColors addObject:noColor];
        }
        [self.bgColors addObject:bcolor];
    }else{
        [self.bgColors replaceObjectAtIndex:row withObject:bcolor];
    }
}

- (void)setActionTarget:(id)target
{
    self.target = target;
}

- (void)setBorderColor:(UIColor *)color
{
    _borderColor = color;
}

- (void)addRecord:(NSArray *)record SELNames:(NSArray *)SELs
{
    if (!self.records) {
        self.records = [@[] mutableCopy];
        self.actions = [@[] mutableCopy];
    }
    [self.records addObject:record];
    [self.actions addObject:SELs];
}

- (void)addRecord:(NSArray *)record
{
    NSInteger count = record.count;
    NSMutableArray *temp = [@[] mutableCopy];
    for (NSInteger i = 0; i < count; i++) {
        [temp addObject:noAction];
    }
    [self addRecord:record SELNames:[temp mutableCopy]];
}

- (NSString *)valueAtcolumn:(NSInteger)column InRow:(NSInteger)row
{
    UIButton *btn = [self.formView itemAtColumn:column inRow:row];
    return btn.currentTitle;
}

# pragma mark - formView dataSource
- (NSInteger)numberOfRowsInFormView:(KWFormView *)formView
{
    return self.records.count;
}

- (NSInteger)formViewColumnsInRow:(KWFormView *)formView
{
    return [self.records.firstObject count];
}

- (NSString *)formView:(KWFormView *)formView textForColumn:(NSInteger)column inRow:(NSInteger)row
{
    return self.records[row][column];
}

- (UIColor *)formViewBorderColor:(KWFormView *)formView
{
    return self.borderColor;
}

- (UIColor *)formView:(KWFormView *)formView colorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    if ([self.bgColors[row] isKindOfClass:[NSString class]]) {
        return nil;
    }
    return self.bgColors[row];
}

- (UIColor *)formView:(KWFormView *)formView contentColorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    if ([self.textColors[row] isKindOfClass:[NSString class]]) {
        return nil;
    }
    return self.textColors[row];
}

- (BOOL)formView:(KWFormView *)formView addActionForColumn:(NSInteger)column inRow:(NSInteger)row
{
    if ([self.actions[row][column] isEqualToString:noAction]) {
        return NO;
    }else
    {
        return YES;
    }
}

- (CGFloat)formView:(KWFormView *)formView widthForColumn:(NSInteger)column
{
    return [self.widths[column] floatValue];
}

- (void)formView:(KWFormView *)formView didSelectColumn:(NSInteger)column inRow:(NSInteger)row
{
    if (![self.actions[row][column] isEqualToString:noAction]) {
        SEL sel= NSSelectorFromString(self.actions[row][column]);
        if ([self.target respondsToSelector:sel]) {
            UIButton *btn = [self.formView itemAtColumn:column inRow:row];
            [self.target performSelector:sel withObject:btn];
        }
    }
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com