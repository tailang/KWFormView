//
//  KWPerson.h
//  KWFormViewDemo
//
//  Created by kevin on 15/3/20.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWPerson : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, assign) NSInteger age;
+ (instancetype)personWithDict:(NSDictionary *)dict;
+ (NSArray *)personsWithDictArray:(NSArray *)dicts;
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com