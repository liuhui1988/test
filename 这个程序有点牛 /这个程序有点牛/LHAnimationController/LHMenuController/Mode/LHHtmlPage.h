//
//  LHHtmlPage.h
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/25.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHHtmlPage : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *html;
@property(nonatomic,copy)NSString *ID;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)htmlPageWithDict:(NSDictionary *)dict;

@end
