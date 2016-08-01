//
//  LHProduce.h
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/25.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHProduce : NSObject

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,copy)NSString *schemes;
@property(nonatomic,copy)NSString *appUrl;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)productWithDict:(NSDictionary *)dict;
@end
