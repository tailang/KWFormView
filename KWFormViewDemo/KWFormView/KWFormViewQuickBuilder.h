//
//  KWFormViewQuickBuilder.h
//  KWFormViewDemo
//
//  Created by kevin on 15/3/18.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWFormView.h"

extern NSString *const noAction;
extern NSString *const noColor;

@interface KWFormViewQuickBuilder : NSObject
- (KWFormView *)startCreatWithWidths:(NSArray *)widths startPoint:(CGPoint)point;

- (void)setTextColor:(UIColor *)tcolor backgroundColor:(UIColor *)bcolor forRow:(NSInteger)row;

- (void)setBorderColor:(UIColor *)color;

- (void)setActionTarget:(id)target;

- (void)addRecord:(NSArray *)record SELNames:(NSArray *)SELs;

- (void)addRecord:(NSArray *)record;

- (NSString *)valueAtcolumn:(NSInteger)column InRow:(NSInteger)row;
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com