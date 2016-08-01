//
//  LHAboutViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/25.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHAboutViewController.h"

@interface LHAboutViewController ()

@end

@implementation LHAboutViewController

- (void)viewDidLoad {
    
       [super viewDidLoad];
    // Do any additional setup after loading the view.
    LSMenuItem *item1 = [LSMenuArrowItem itemWithIcon:nil title:@"评分支持"];
    
    item1.operation = ^{
        //跳到appstore 对应的应用的界面
        /*1.评分
         》使用UIApplication打开URL 如 "itms-apps://itunes.apple.com/cn/app/%@?mt=8"
         》注意把id替换成appid //eg.725296055
         //appid 与bundleId是不同，每一个应用上传到appstore之后，就会有一个ID,这个ID是纯数字
         》什么是appID,每个应用上架后就有个application ID
         */
        
        //itms-apps://itunes.apple.com/cn/app/725296055?mt=8
        NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/%@?mt=8",@"725296055"];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
    };
    LSMenuItem *item2= [LSMenuArrowItem itemWithIcon:nil title:@"客户电话" ];
    item2.subTitle = @"10086";
    item2.operation = ^{
        //打电话
        NSURL *url = [NSURL URLWithString:@"tel://10010"];
        [[UIApplication sharedApplication] openURL:url];
    };
    
    LSMenuItemGroup *group = [[LSMenuItemGroup alloc] init];
    group.items = @[item1,item2];
    
    [self.cellData addObject:group];}



@end
