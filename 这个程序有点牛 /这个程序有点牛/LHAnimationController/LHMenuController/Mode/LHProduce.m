//
//  LHProduce.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/25.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHProduce.h"

@implementation LHProduce

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
       
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.identifier = dict[@"id"];
        self.schemes = dict[@"customUrl"];
        self.appUrl = dict[@"url"];
        
    }
    
    return self;
}
+(instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}


@end
