//
//  LHTextFieldView.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/7/5.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHTextFieldView.h"
#import "Masonry.h"

@implementation LHTextFieldView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        
        //初始化 背景View
        UIView *bgView = [[UIView alloc]init];
        bgView.layer.cornerRadius = 5.0;
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.borderWidth = 1;
        bgView.layer.borderColor = [[UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.00] CGColor];
        self.bgView = bgView;
        [self addSubview:bgView];
        
        //初始化 标题
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel = titleLabel;
        [bgView addSubview:titleLabel];
        
        //初始化 文本框
        UITextField *textField = [[UITextField alloc]init];
        textField.font = [UIFont systemFontOfSize:14];
        
        //修改placehoder的颜色和大小没写
        
        
        self.textField = textField;
        [bgView addSubview:textField];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //布局背景View
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.top.left.mas_equalTo(self);
    }];
    
    //布局标题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(75);
        make.left.mas_equalTo(self).offset(12);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    //布局textfield
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right);
        make.right.mas_equalTo(self);
        make.height.offset(30);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
}


@end
