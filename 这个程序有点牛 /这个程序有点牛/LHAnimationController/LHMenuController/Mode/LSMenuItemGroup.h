//
//  LSMenuItemGroup.h
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSMenuItemGroup : NSObject

/**
 *  组的头部标题
 */
@property(nonatomic,copy)NSString *headerTitle;

/**
 *  组的尾部标题
 */
@property(nonatomic,copy)NSString *footerTitle;


/**
 *  组的每一行数据模型
 */
@property(nonatomic,strong)NSArray *items;


@end
