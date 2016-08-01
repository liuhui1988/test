//
//  LHWeel.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/26.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHWeel.h"
#import "LHWeelButton.h"

#define RandomColor [UIColor colorWithRed:arc4random_uniform(255) /255.0 green:arc4random_uniform(255) /255.0 blue:arc4random_uniform(255) /255.0 alpha:1]

@interface LHWeel()

@property (weak, nonatomic) IBOutlet UIImageView *rotateWheel;



/**
 *  选中的按钮
 */
@property(nonatomic,strong)UIButton *selectedBtn;


//定时器
@property(nonatomic,strong)CADisplayLink *link;

@end

@implementation LHWeel


+(instancetype)wheel{
    return [[[NSBundle mainBundle] loadNibNamed:@"LHWeel" owner:nil options:nil] lastObject];
}


-(void)awakeFromNib{
    //添加12按钮
    NSInteger btnCount = 12;
    
    CGFloat angle = M_PI / 6;
    //获取正常状态的大图片
    
    UIImage *normalBigImg = [UIImage imageNamed:@"LuckyAnimal"];
    
    //获取选中状态的大图片
    UIImage *selBigImage = [UIImage imageNamed:@"LuckyAnimalPressed"];
#warning 获取的尺寸是关于点
    //设置每个小图片的宽度和高度
    CGFloat imgW = normalBigImg.size.width / btnCount ;
    CGFloat imgH = normalBigImg.size.height;
    
    for (NSInteger i = 0; i < btnCount; i ++) {
        //创建按钮
        UIButton *btn = [LHWeelButton buttonWithType:UIButtonTypeCustom];
        
        //设置大小
        btn.bounds = CGRectMake(0, 0, 68, 143);
        
        //随机设置背景颜色
        //btn.backgroundColor = RandomColor;
        
        //设置位置
        //UIVIew能显示在屏幕上，是因为它有个图层，如果设置UIVIew的位置，间接设置了图层的Position
        //设置按钮图层的锚点
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
#warning 默认控件的center 就是 图层的postion
        //btn.layer.position = self.rotateWheel.center;
        btn.center = self.rotateWheel.center;
        
        //旋转
        btn.transform = CGAffineTransformMakeRotation(angle * i);
        
        //对应图片的区域
        CGRect imgRect = CGRectMake(imgW * i, 0, imgW, imgH);
        
        //剪切LuckyAstrology对应的图片
        
#warning 剪切图片是针对像素
        CGImageRef normalImgRef = CGImageCreateWithImageInRect(normalBigImg.CGImage, imgRect);
        
        //设置正常状态的图片
        [btn setImage:[UIImage imageWithCGImage:normalImgRef] forState:UIControlStateNormal];
        
        //设置选中状态的图片
        CGImageRef selImgRef = CGImageCreateWithImageInRect(selBigImage.CGImage, imgRect);
        
        [btn setImage:[UIImage imageWithCGImage:selImgRef] forState:UIControlStateSelected];
        
        
        //设置选中的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        //监听事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        //默认第一个按钮选中
        if (i == 0) {
            [self btnClick:btn];
        }
        [self.rotateWheel addSubview:btn];
        
    }
    
}


-(void)btnClick:(UIButton *)btn{
    
    //去除以前选中
    self.selectedBtn.selected = NO;
    
    
    //设置当前选中
    btn.selected = YES;
    self.selectedBtn = btn;
    
    
}
- (IBAction)centerBtnClick:(id)sender {
    
    //去除以前的自动旋转
    [self stopAutoRotate];
    
    //开始选号
    
    //快速旋转 ,其它按钮不给点
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI * 6);
    rotationAni.duration = 3;
    
    //设置代理
    rotationAni.delegate = self;
    
    [self.rotateWheel.layer addAnimation:rotationAni forKey:nil];
    
    
    
    
}

#pragma mark 核心动画的代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //核心动画结束后，2秒后自动旋转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startAutoRotate];
    });
    
}

/**
 *  停止自动旋转
 */
- (void)stopAutoRotate{
    NSLog(@"%s",__func__);
    //停止旋转
    
    //禁用定时器
    [self.link invalidate];
    self.link = nil;
}

/**
 *  开始自动旋转
 */
- (void)startAutoRotate{
    NSLog(@"%s",__func__);
    
    //旋转的方案
    //核心动画 核心动画是个假象
    //    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    //    rotationAni.keyPath = @"transform.rotation";
    //
    //    rotationAni.byValue = @(M_PI * 2);
    //
    //    rotationAni.duration = 5;
    //
    //    [self.rotateWheel.layer addAnimation:rotationAni forKey:nil];
    
    //如果当前有定时器，就不要添加了
    if(self.link) return;
    
    
    //transfrom
    //开始一个定时器
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}

#pragma mark 实现旋转
-(void)update{
    CGFloat angle = M_PI_4 / 60;
    self.rotateWheel.transform = CGAffineTransformRotate(self.rotateWheel.transform, angle);
}
@end
