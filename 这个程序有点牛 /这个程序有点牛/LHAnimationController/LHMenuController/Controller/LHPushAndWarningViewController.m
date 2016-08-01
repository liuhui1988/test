//
//  LHPushAndWarningViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHPushAndWarningViewController.h"
#import "LSMenuItem.h"
#import "LSMenuItemGroup.h"
#import "LSMenuArrowItem.h"
#import "LSMenuSwitchItem.h"
#import "LSMenuLabelItem.h"
#import "LHAwardAnimationViewController.h"
#import "LHAwardNumPushViewController.h"
#import "LHScoreLiveWarnningViewController.h"

@interface LHPushAndWarningViewController ()

@end

@implementation LHPushAndWarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LSMenuItem *item1 = [LSMenuArrowItem itemWithIcon:@"handShake" title:@"开奖号码推送" vcClass:[LHAwardNumPushViewController class]];
    LSMenuItem *item2 = [LSMenuArrowItem itemWithIcon:@"handShake" title:@"中奖动画" vcClass:[LHAwardAnimationViewController class]];

    LSMenuItem *item3 = [LSMenuArrowItem itemWithIcon:@"handShake" title:@"比分直播提醒" vcClass:[LHScoreLiveWarnningViewController class]];
    
    LSMenuItemGroup *group = [[LSMenuItemGroup alloc] init];
    group.items = @[item1,item2,item3];
    group.headerTitle = @"这小子真帅";
    group.footerTitle = @"楼上说的是假话";
    
    [self.cellData addObject:group];
    
}



@end
