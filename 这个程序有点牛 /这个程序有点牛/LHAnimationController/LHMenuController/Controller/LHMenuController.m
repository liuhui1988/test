//
//  LHMenuController.m
//  做一个有思想的软件
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHMenuController.h"
#import "LSMenuItem.h"
#import "LSMenuItemGroup.h"
#import "LSMenuArrowItem.h"
#import "LSMenuSwitchItem.h"
#import "LSMenuLabelItem.h"
#import "LHPushAndWarningViewController.h"
#import "MBProgressHUD+MJ.h"
#import "LHHelpViewController.h"
#import "LHAboutViewController.h"
#import "LHShareViewController.h"
#import "LHLoginViewController.h"
@interface LHMenuController ()

@end

@implementation LHMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"菜单展示";
   
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    
    //初始化数据
    //第一组
    LSMenuItem *item1 = [LSMenuArrowItem itemWithIcon:@"handShake" title:@"推送和提醒" vcClass:[LHPushAndWarningViewController class]];
    LSMenuItem *item2 = [LSMenuSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    LSMenuItem *item3 = [LSMenuSwitchItem itemWithIcon:@"handShake" title:@"声音和效果"];
    //NSArray *group1 = @[item1,item2,item3];
    //创建组模型
    LSMenuItemGroup *group1 = [[LSMenuItemGroup alloc] init];
    group1.items = @[item1,item2,item3];
    group1.headerTitle = @"这小子真帅";
    group1.footerTitle = @"楼上说的是假话";
    
    [self.cellData addObject:group1];
    
    
    //第二组
    LSMenuItem *item4 = [LSMenuArrowItem itemWithIcon:@"handShake" title:@"检查版本更新"];
    
    item4.operation = ^(){
        
        NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
        NSLog(@"%@",info);
        NSString *localVersion = info[@"CFBundleShortVersionString"];
        
        // 3.对比
        NSLog(@"正在检查的版本更新");
        
        
        //现在，给一个假象
        [MBProgressHUD showMessage:@"正在检查版本更新中..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"当前已经是最新版本"];
        });
    };
    
    LSMenuItem *item5 = [LSMenuArrowItem itemWithIcon:@"handShake" title:@"帮助" vcClass:[LHHelpViewController class]];
    
    LSMenuItem *item6 = [LSMenuArrowItem itemWithIcon:@"handShake" title:@"分享" vcClass:[LHShareViewController class]];

    
    
    LSMenuItem *item7 = [LSMenuArrowItem itemWithIcon:@"handShake" title:@"关于" vcClass:[LHAboutViewController  class]];
    LSMenuItemGroup *group2 = [[LSMenuItemGroup alloc] init];
    group2.items = @[item4,item5,item6,item7];
    group2.headerTitle = @"这小子真帅";
    group2.footerTitle = @"楼上说的是假话";
    [self.cellData addObject:group2];
}

-(void)click
{
    LHLoginViewController * login =[[LHLoginViewController alloc]init];
    
    login.title=@"登录";
    
    [self.navigationController pushViewController:login animated:YES];
}


@end
