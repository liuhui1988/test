//
//  LHForgetViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/7/5.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHForgetViewController.h"
#import "LHTextFieldView.h"
#import "LHNewPasswordViewController.H"
#import "Masonry.h"

@interface LHForgetViewController ()

//手机号码TxF
@property(nonatomic,weak) LHTextFieldView *phoneTextView;
//验证码按钮
@property(nonatomic,weak) UIButton *requestCodeButton;

@end

@implementation LHForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条
    [self setupNavBar];
    
    self.view.backgroundColor=[UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    
    UILabel *topLabel = [[UILabel alloc]init];
    topLabel.text = [NSString stringWithFormat:@"请输入注册时填写的手机号码"];
    topLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(100);
        make.left.offset(15);
    }];
    
    
    //手机号码
    LHTextFieldView *phoneTextView = [[LHTextFieldView alloc]init];
    [self.view addSubview:phoneTextView];
    [phoneTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topLabel).offset(25);
        make.left.mas_equalTo(self.view).offset(15);
        make.right.mas_equalTo(self.view).offset(-15);
        make.height.offset(45);
    }];
    phoneTextView.titleLabel.text = @"手机号：";
    phoneTextView.textField.placeholder = @"请输入手机号码";
    //键盘类型为数字键盘
    phoneTextView.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTextView = phoneTextView;
    
    
    //发送验证码
    UIButton *requestCodeButton = [[UIButton alloc]init];
    [requestCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    requestCodeButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [requestCodeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.requestCodeButton = requestCodeButton;
    [self.view addSubview:requestCodeButton];
    [requestCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneTextView.mas_bottom).offset(25);
        make.left.width.height.mas_equalTo(phoneTextView);
    }];
    [requestCodeButton addTarget:self action:@selector(requestCodeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.phoneTextView.textField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    //默认调用一次文本框内容发生改变的方法
    [self textChange];
    
}


//当文本框内容发生改变时调用
- (void)textChange{
    self.requestCodeButton.enabled = self.phoneTextView.textField.text.length;
}


-(void)requestCodeButtonClick {
    [self.view endEditing:YES];
    
    NSString *phoneNum = self.phoneTextView.textField.text;
    
  }

//设置导航条
- (void)setupNavBar{
    
    self.title = @"注册";
    
    }

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
    
    LHNewPasswordViewController *newPwdVC = [[LHNewPasswordViewController alloc]init];
    newPwdVC.phoneNum = self.phoneTextView.textField.text;
    [self.navigationController pushViewController:newPwdVC animated:YES];
    
}


@end
