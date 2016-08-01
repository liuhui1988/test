//
//  LHAnimationController.m
//  做一个有思想的软件
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHAnimationController.h"
#import "LHWeel.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width

#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface LHAnimationController ()

@property(nonatomic,weak)UIImageView * imageView;



@end

@implementation LHAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * image =[UIImage imageNamed:@"LuckyBackground"];
    
    UIImageView * imageView =[[UIImageView alloc]initWithImage:image];
    
    imageView.frame=CGRectMake(0, 64, ScreenW , ScreenH-108);
    
    _imageView=imageView;
    
    [self.view addSubview:_imageView];
    
    LHWeel *wheel = [LHWeel wheel];
    
    wheel.center = self.view.center;
    
    _wheel=wheel;
    
    [self.view addSubview:_wheel];
    
    UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
     btn.frame=CGRectMake( 50, 80,80 , 80);
    [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * btn1 =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"停止" forState:UIControlStateNormal];
    btn1.frame=CGRectMake(150, 80,80 , 80);
    [btn1 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

}

-(void)start
{
    [self.wheel startAutoRotate];
}
-(void)stop
{
    [self.wheel stopAutoRotate];
}
@end
