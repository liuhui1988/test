//
//  LHScoreLiveWarnningViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHScoreLiveWarnningViewController.h"

@interface LHScoreLiveWarnningViewController ()

@end

@implementation LHScoreLiveWarnningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LSMenuItem *item1 = [LSMenuSwitchItem itemWithIcon:@"handShake" title:@"提醒我关注的比赛"];
    
    LSMenuItemGroup *group1= [[LSMenuItemGroup alloc] init];
    group1.items = @[item1];
    group1.headerTitle = @"这小子真帅";
    group1.footerTitle = @"楼上说的是假话";
    
    [self.cellData addObject:group1];
    
    LSMenuItem *item2 = [LSMenuLabelItem itemWithIcon:@"handShake" title:@"起始时间"];
    
    LSMenuItemGroup *group2 = [[LSMenuItemGroup alloc] init];
    group2.items = @[item2];
    group2.headerTitle = @"这小子真帅";
    group2.footerTitle = @"楼上说的是假话";
    
    [self.cellData addObject:group2];
    
    LSMenuItem *item3 = [LSMenuLabelItem itemWithIcon:@"handShake" title:@"结束时间"];
    
    LSMenuItemGroup *group3 = [[LSMenuItemGroup alloc] init];
    group3.items = @[item3];
    group3.headerTitle = @"这小子真帅";
    group3.footerTitle = @"楼上说的是假话";
    
    [self.cellData addObject:group3];
    
    
    
    
}



@end
