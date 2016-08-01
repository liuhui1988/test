//
//  LHHtmlPage.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/25.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHHtmlPage.h"

@implementation LHHtmlPage

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        
        self.html = dict[@"html"];
        self.title = dict[@"title"];
        self.ID = dict[@"id"];
    }
    return self;
}


+(instancetype)htmlPageWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
