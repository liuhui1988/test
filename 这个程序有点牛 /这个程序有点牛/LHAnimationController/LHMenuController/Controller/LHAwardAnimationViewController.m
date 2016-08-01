//
//  LHAwardAnimationViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHAwardAnimationViewController.h"

@interface LHAwardAnimationViewController ()

@end

@implementation LHAwardAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LSMenuItem *item1 = [LSMenuSwitchItem itemWithIcon:@"handShake" title:@"中奖动画"];
    
    LSMenuItemGroup *group = [[LSMenuItemGroup alloc] init];
    group.items = @[item1];
    group.headerTitle = @"这小子真帅";
    group.footerTitle = @"楼上说的是假话";
    
    [self.cellData addObject:group];
    
}


@end
