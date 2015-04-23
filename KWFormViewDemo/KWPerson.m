//
//  KWPerson.m
//  KWFormViewDemo
//
//  Created by kevin on 15/3/20.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import "KWPerson.h"

@implementation KWPerson
+ (NSArray *)personsWithDictArray:(NSArray *)dicts
{
    NSMutableArray *temp = [@[] mutableCopy];
    for (NSDictionary *dict in dicts) {
        KWPerson *person = [self personWithDict:dict];
        [temp addObject:person];
    }
    return [temp copy];
}

+ (instancetype)personWithDict:(NSDictionary *)dict
{
    KWPerson *person = [[KWPerson alloc] init];
    person.name = dict[@"name"];
    person.sex = dict[@"sex"];
    person.age = [dict[@"age"] integerValue];
    return person;
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com