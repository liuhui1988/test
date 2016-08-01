//
//  HotViewController.m
//  网易新闻
//
//  Created by xiaomage on 15/10/23.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "HotViewController.h"
#import "CZCar.h"
#import "CZCarGroup.h"

@interface HotViewController ()<UITableViewDataSource>
@property (nonatomic, strong) NSArray *carGroups;
@end

@implementation HotViewController

//1 懒加载
- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        _carGroups = [CZCarGroup carGroupsList];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //2 测试数据
    
    //3 连线设置数据源
    //4 让controller遵守数据源协议
}

//5 实现数据源的方法
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //共多少组
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //
    CZCarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建可重用cell对象
    static NSString *reuseId = @"car";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    //2 给cell内部的子控件赋值
    //
    CZCarGroup *carGroup = self.carGroups[indexPath.section];
    
    cell.textLabel.text = [carGroup.cars[indexPath.row] name];
    CZCar * cars =carGroup.cars[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:cars.icon];
    
    
    //3 返回cell
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //    CZCarGroup *carGroup = self.carGroups[section];
    //    return carGroup.title;
    return [self.carGroups[section] title];
}
//返回组的索引标题
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //kvc
    return [self.carGroups valueForKeyPath:@"title"];
}


@end
