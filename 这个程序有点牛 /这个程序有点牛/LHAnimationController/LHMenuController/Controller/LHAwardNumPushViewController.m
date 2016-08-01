//
//  LHAwardNumPushViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHAwardNumPushViewController.h"
#import "LSMenuItem.h"
#import "LSMenuItemGroup.h"
#import "LSMenuArrowItem.h"
#import "LSMenuSwitchItem.h"
#import "LSMenuLabelItem.h"

@interface LHAwardNumPushViewController ()

@end

@implementation LHAwardNumPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LSMenuItem *item1 = [LSMenuSwitchItem itemWithIcon:@"handShake" title:@"双色球"];
    LSMenuItem *item2 = [LSMenuSwitchItem itemWithIcon:@"handShake" title:@"大乐透"];
    
    
    LSMenuItemGroup *group = [[LSMenuItemGroup alloc] init];
    group.items = @[item1,item2];
    group.headerTitle = @"这小子真帅";
    group.footerTitle = @"楼上说的是假话";
    
    [self.cellData addObject:group];
    
    
}




@end
