//
//  LSMenuItem.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LSMenuItem.h"

@implementation LSMenuItem

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
    }
    
    return self;
}
+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title{
    return [[self alloc] initWithIcon:icon title:title];
}

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass{
   
    LSMenuItem *item = [self itemWithIcon:icon title:title];
    
    item.vcClass = vcClass;
    
    return item;
}


@end
