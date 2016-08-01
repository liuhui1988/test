//
//  CZCarGroup.m
//  B01-汽车分组升级
//
//  Created by Apple on 14/12/17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZCarGroup.h"
#import "CZCar.h"
@implementation CZCarGroup
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+ (instancetype)carGroupWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)carGroupsList
{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        CZCarGroup *carGroup = [CZCarGroup carGroupWithDic:dic];
        
        //字典转模型
        NSMutableArray *tmpCarArray = [NSMutableArray array];
        for (NSDictionary *dicTmp in carGroup.cars) {
            CZCar *car = [CZCar carWithDic:dicTmp];
            [tmpCarArray addObject:car];
        }

        carGroup.cars = tmpCarArray;
        
        [tmpArray addObject:carGroup];
    }
    return tmpArray;
}
@end
