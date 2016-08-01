//
//  LHViewCell.h
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSMenuItem;
@interface LHViewCell : UITableViewCell

@property(nonatomic,strong)LSMenuItem * item;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
