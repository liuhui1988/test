//
//  LHViewCell.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/24.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHViewCell.h"
#import "LSMenuItem.h"
#import "LSMenuArrowItem.h"
#import "LSMenuLabelItem.h"
#import "LSMenuSwitchItem.h"

@interface LHViewCell()

@property(nonatomic,strong)UIImageView *mArrow;


@property(nonatomic,strong)UISwitch *mSwitch;


@property(nonatomic,strong)UILabel *mLabel;

@end

@implementation LHViewCell

-(UIImageView *)mArrow{
    if (!_mArrow) {
        _mArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    
    return _mArrow;
}


-(UISwitch *)mSwitch{
    if (!_mSwitch) {
        _mSwitch = [[UISwitch alloc] init];
        
        //监听事件
        [_mSwitch addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        
    }
    
    return _mSwitch;
}

-(void)valueChange:(UISwitch *)mSwitch{
    //把开关状态保存到用户偏好设置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:mSwitch.isOn forKey:self.item.title];
    [defaults synchronize];//保存同步
}

-(UILabel *)mLabel{
    if(!_mLabel){
        UILabel *label = [[UILabel alloc] init];
        label.bounds = CGRectMake(0, 0, 80, 44);
        label.text = @"00:00";
        _mLabel = label;
        
    }
    return _mLabel;
}

-(void)setItem:(LSMenuItem *)item
{
    _item = item;
    
    //显示图片和标题
    self.textLabel.text = item.title;
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    
    
    //设置箭头
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if ([item isKindOfClass:[LSMenuArrowItem class]]) {//箭头
        self.accessoryView = self.mArrow;
        
        //箭头可以选中
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if([item isKindOfClass:[LSMenuSwitchItem class]]){//开关
        //设置开关的状态
        self.mSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:item.title];
        self.accessoryView = self.mSwitch;
        
        //开关的cell不能选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if([item isKindOfClass:[LSMenuLabelItem class]]){//右边添加一个Label
        
        self.accessoryView = self.mLabel;
        //Lable的cell可以选中
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        
    }
    

}

+(instancetype)cellWithTableView:(UITableView *)tableView{
   
    static NSString *ID = @"MenuCell";
    LHViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[LHViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    
    return cell;
}

@end
