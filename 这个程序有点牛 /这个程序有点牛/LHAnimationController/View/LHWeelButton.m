//
//  LHWeelButton.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/26.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHWeelButton.h"

@implementation LHWeelButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    //固定图片的大小
    CGFloat imgW = 40;
    CGFloat imgH = 48;
    CGFloat imgX =(contentRect.size.width - imgW)*0.5;
    return CGRectMake(imgX, 20, imgW, imgH);
}

@end
