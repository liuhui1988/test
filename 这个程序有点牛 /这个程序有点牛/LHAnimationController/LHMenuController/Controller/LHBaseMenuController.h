//
//  LHBaseMenuController.h
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LSMenuItem.h"
#import "LSMenuItemGroup.h"
#import "LSMenuArrowItem.h"
#import "LSMenuSwitchItem.h"
#import "LSMenuLabelItem.h"
#import "LHViewCell.h"
@interface LHBaseMenuController : UITableViewController

@property(nonatomic,strong)NSMutableArray *cellData;

@end
