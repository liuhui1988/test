//
//  LHNavigationController.m
//  做一个有思想的软件
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHNavigationController.h"
#import "UIBarButtonItem+Item.h"
@interface LHNavigationController ()

@end

@implementation LHNavigationController

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
  
}
    
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
    {
        if (self.childViewControllers.count) { // 不是根控制器
            
            viewController.hidesBottomBarWhenPushed = YES;
            
            UIBarButtonItem *left = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(popToPre) forControlEvents:UIControlEventTouchUpInside];
            // 设置导航条的按钮
            viewController.navigationItem.leftBarButtonItem = left;
            
            UIBarButtonItem *right = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
            viewController.navigationItem.rightBarButtonItem = right;
        }
        
        [super pushViewController:viewController animated:animated];
        
    }
    
    - (void)popToRoot
    {
        [self popToRootViewControllerAnimated:YES];
    }
    - (void)popToPre
    {
        [self popViewControllerAnimated:YES];
    }


@end
