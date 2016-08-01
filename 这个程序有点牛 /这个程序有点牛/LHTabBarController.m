//
//  LHTabBarController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//


#import "LHTabBarController.h"
#import "UIImage+Image.h"
#import "LHHomeController.h"
#import "LHMenuController.h"
#import "LHAnimationController.h"
#import "LHNavigationController.h"
#import "CZHomeViewController.h"

@interface LHTabBarController ()

@end

@implementation LHTabBarController

+ (void)initialize
{
    
    // self -> CZTabBarController
    // 获取当前这个类下面的所有tabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 创建属性字典
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    // 设置模型的标题属性修改控件的文字颜色
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self SetUpAllChildrenController];
    
}

-(void)SetUpAllChildrenController
{
    // 首页
    LHHomeController *home = [[LHHomeController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"ui展示"];

    
 
    // 消息
    CZHomeViewController *message = [[CZHomeViewController alloc] init];
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"网络展示"];

    

    // 发现
    LHAnimationController *discover = [[LHAnimationController alloc] init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"动画展示"];
    

    // 我
    LHMenuController *profile = [[LHMenuController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"菜单展示"];

    
    
    
    
}

- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    LHNavigationController * nav =[[LHNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
    
    
    
    
}


@end
