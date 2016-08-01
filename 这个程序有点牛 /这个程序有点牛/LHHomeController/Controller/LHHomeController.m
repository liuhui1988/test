//
//  LHHomeController.m
//  做一个有思想的软件
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHHomeController.h"
#import "HotViewController.h"
#import "SocietyViewController.h"
#import "ReaderViewController.h"
#import "ScienceViewController.h"


static CGFloat const labelW = 100;

static CGFloat const radio = 1.3;

#define ScreenW [UIScreen mainScreen].bounds.size.width

#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface LHHomeController ()<UIScrollViewDelegate>

@property(nonatomic,weak)UILabel * selLabel;

@property(nonatomic,weak)UIScrollView * titleScrollView;

@property(nonatomic,weak)UIScrollView * contentScrollView;

@property (nonatomic, strong) NSMutableArray *titleLabels;



@end

@implementation LHHomeController

- (NSMutableArray *)titleLabels
{
    if (_titleLabels == nil) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self SetUpScrollView];
    
    [self setUpChildViewController];
    
    // 2.添加所有子控制器对应标题
    [self setUpTitleLabel];
    
    // iOS7会给导航控制器下所有的UIScrollView顶部添加额外滚动区域
    // 不想要添加
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setUpScrollView];
  
    

}

- (void)setUpChildViewController
{

    
    // 热点
    HotViewController *hot = [[HotViewController alloc] init];
    hot.title = @"ui布局1";
    [self addChildViewController:hot];
    
    // 社会
    SocietyViewController *society = [[SocietyViewController alloc] init];
    society.title = @"ui布局2";
    [self addChildViewController:society];
    
    // 阅读
    ReaderViewController *reader = [[ReaderViewController alloc] init];
    reader.title = @"ui布局3";
    [self addChildViewController:reader];
    
    // 科技
    ScienceViewController *science = [[ScienceViewController alloc] init];
    science.title = @"ui布局4";
    [self addChildViewController:science];
    
    
}

- (void)setUpTitleLabel
{
    NSUInteger count = self.childViewControllers.count;
    
    CGFloat labelX = 0;
    CGFloat labelY = 0;
    CGFloat labelH = 44;
    
    for (int i = 0; i < count; i++) {
        // 获取对应子控制器
        UIViewController *vc = self.childViewControllers[i];
        
        // 创建label
        UILabel *label = [[UILabel alloc] init];
        
        labelX = i * labelW;
        
        // 设置尺寸
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        // 设置label文字
        label.text = vc.title;
        
        // 设置高亮文字颜色
        label.highlightedTextColor = [UIColor redColor];
        
        // 设置label的tag
        label.tag = i;
        
        // 设置用户的交互
        label.userInteractionEnabled = YES;
        
        // 文字居中
        label.textAlignment = NSTextAlignmentCenter;
        
        
        // 添加到titleLabels数组
        [self.titleLabels addObject:label];
        
        // 添加点按手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClick:)];
        [label addGestureRecognizer:tap];
        
        // 默认选中第0个label
        if (i == 0) {
            [self titleClick:tap];
        }
        
        // 添加label到标题滚动条上
        [self.titleScrollView addSubview:label];
    }
    
}
- (void)setUpTitleCenter:(UILabel *)centerLabel
{
    // 计算偏移量
    CGFloat offsetX = centerLabel.center.x - ScreenW * 0.5;
    
    if (offsetX < 0) offsetX = 0;
    
    // 获取最大滚动范围
    CGFloat maxOffsetX = self.titleScrollView.contentSize.width -ScreenW;
    
    if (offsetX > maxOffsetX) offsetX = maxOffsetX;
    
    
    // 滚动标题滚动条
    [self.titleScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
}

#pragma mark - UIScrollViewDelegate
// scrollView一滚动就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat curPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    // 左边label角标
    NSInteger leftIndex = curPage;
    // 右边的label角标
    NSInteger rightIndex = leftIndex + 1;
    
    // 获取左边的label
    UILabel *leftLabel = self.titleLabels[leftIndex];
    
    // 获取右边的label
    UILabel *rightLabel;
    if (rightIndex < self.titleLabels.count - 1) {
        rightLabel = self.titleLabels[rightIndex];
    }
    
    // 计算下右边缩放比例
    CGFloat rightScale = curPage - leftIndex;
    NSLog(@"rightScale--%f",rightScale);
    
    // 计算下左边缩放比例
    CGFloat leftScale = 1 - rightScale;
    NSLog(@"leftScale--%f",leftScale);
    
    // 0 ~ 1
    // 1 ~ 2
    // 左边缩放
    leftLabel.transform = CGAffineTransformMakeScale(leftScale * 0.3 + 1, leftScale * 0.3+ 1);
    
    // 右边缩放
    rightLabel.transform = CGAffineTransformMakeScale(rightScale * 0.3 + 1, rightScale * 0.3+ 1);
    
    // 设置文字颜色渐变
    /*
     R G B
     黑色 0 0 0
     红色 1 0 0
     */
    leftLabel.textColor = [UIColor colorWithRed:leftScale green:0 blue:0 alpha:1];
    rightLabel.textColor = [UIColor colorWithRed:rightScale green:0 blue:0 alpha:1];
    
    NSLog(@"%f",curPage);
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 1.添加子控制器view
    [self showVc:index];
    
    // 2.把对应的标题选中
    UILabel *selLabel = self.titleLabels[index];
    
    [self selectLabel:selLabel];
    
    // 3.让选中的标题居中
    [self setUpTitleCenter:selLabel];
    
    
}

// 显示控制器的view
- (void)showVc:(NSInteger)index
{
    CGFloat offsetX = index * ScreenW;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    
    
    
    [self.contentScrollView addSubview:vc.view];
    
    vc.view.frame = CGRectMake(offsetX, 0, ScreenW,ScreenH-152);
}

// 点击标题的时候就会调用
- (void)titleClick:(UITapGestureRecognizer *)tap
{
    
    // 0.获取选中的label
    UILabel *selLabel = (UILabel *)tap.view;
    
    // 1.标题颜色变成红色,设置高亮状态下的颜色
    [self selectLabel:selLabel];
    
    // 2.滚动到对应的位置
    NSInteger index = selLabel.tag;
    // 2.1 计算滚动的位置
    CGFloat offsetX = index * ScreenW;
    self.contentScrollView.contentOffset = CGPointMake(offsetX, 0);
    
    // 3.给对应位置添加对应子控制器
    [self showVc:index];
    
    // 4.让选中的标题居中
    [self setUpTitleCenter:selLabel];
    
}

// 选中label
- (void)selectLabel:(UILabel *)label
{
    // 取消高亮
    _selLabel.highlighted = NO;
    // 取消形变
    _selLabel.transform = CGAffineTransformIdentity;
    // 颜色恢复
    _selLabel.textColor = [UIColor blackColor];
    
    // 高亮
    label.highlighted = YES;
    // 形变
    label.transform = CGAffineTransformMakeScale(radio, radio);
    
    _selLabel = label;
    
}

-(void)SetUpScrollView
{
    
    
    UIScrollView * titleScrollView =[[UIScrollView alloc]init ];
    
    titleScrollView.frame=CGRectMake(0,64, ScreenW, 44);
    
    titleScrollView.backgroundColor=[UIColor yellowColor];
    
    _titleScrollView=titleScrollView;
    
    [self.view addSubview:_titleScrollView];
    
    
    UIScrollView * contentScrollView =[[UIScrollView alloc]init ];
    
    contentScrollView.frame=CGRectMake(0,108, ScreenW, ScreenH-44);
    
    contentScrollView.backgroundColor=[UIColor redColor];
    
    _contentScrollView=contentScrollView;
    
    [self.view addSubview:_contentScrollView];
    

}
- (void)setUpScrollView
{
    NSUInteger count = self.childViewControllers.count;
    // 设置标题滚动条
    self.titleScrollView.contentSize = CGSizeMake(count * labelW, 0);
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    
    // 设置内容滚动条
    self.contentScrollView.contentSize = CGSizeMake(count * ScreenW, 0);
    // 开启分页
    self.contentScrollView.pagingEnabled = YES;
    // 没有弹簧效果
   // self.contentScrollView.bounces = NO;
    // 隐藏水平滚动条
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    self.contentScrollView.delegate = self;
}

@end
