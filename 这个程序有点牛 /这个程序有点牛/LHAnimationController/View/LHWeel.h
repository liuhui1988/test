//
//  LHWeel.h
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/26.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHWeel : UIView

+(instancetype)wheel;


- (void)stopAutoRotate;

/**
 *  开始自动旋转
 */
- (void)startAutoRotate;

@end
