//
//  CZCar.m
//  B01-汽车分组升级
//
//  Created by Apple on 14/12/17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZCar.h"

@implementation CZCar
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+ (instancetype)carWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}


@end
