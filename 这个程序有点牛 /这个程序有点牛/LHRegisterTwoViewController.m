//
//  LHRegisterTwoViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/7/5.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHRegisterTwoViewController.h"
#import "LHTextFieldView.h"
#import "Masonry.h"

@interface LHRegisterTwoViewController ()

//验证码TxF
@property(nonatomic,weak) LHTextFieldView *smsCodeTextView;
//昵称TxF
@property(nonatomic,weak) LHTextFieldView *usernameTextView;
//密码TxF
@property(nonatomic,weak) LHTextFieldView *passwordTextView;
//重新获取验证码按钮
@property(nonatomic,weak) UIButton *retrieveCodeButton;
//完成按钮
@property(nonatomic,weak) UIButton *completeButton;

@end

@implementation LHRegisterTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条
    [self setupNavBar];
    
    self.view.backgroundColor=[UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    
    
    UILabel *topLabel = [[UILabel alloc]init];
    topLabel.text = [NSString stringWithFormat:@"验证码已经发送到：%@",self.phoneNum];
    topLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(100);
        make.left.offset(15);
    }];
    
    //验证码
    LHTextFieldView *smsCodeTextView = [[LHTextFieldView alloc]init];
    [self.view addSubview:smsCodeTextView];
    [smsCodeTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topLabel).offset(25);
        make.left.mas_equalTo(self.view).offset(15);
        make.width.offset(220);
        make.height.offset(45);
    }];
    smsCodeTextView.titleLabel.text = @"验证：";
    smsCodeTextView.textField.placeholder = @"请输入验证码";
    //键盘类型为数字键盘
    smsCodeTextView.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.smsCodeTextView = smsCodeTextView;
    
    //重发验证码 按钮
    UIButton *retrieveCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    retrieveCodeButton.layer.cornerRadius = 5;
    retrieveCodeButton.layer.borderWidth = 1;
    retrieveCodeButton.layer.borderColor = [[UIColor colorWithRed:0.96 green:0.69 blue:0.18 alpha:1.00] CGColor];
    [retrieveCodeButton setTitleColor:[UIColor colorWithRed:0.96 green:0.69 blue:0.18 alpha:1.00] forState:UIControlStateNormal];
    [retrieveCodeButton setTitle:@"重新获取" forState:UIControlStateNormal];
    retrieveCodeButton.titleLabel.font=[UIFont systemFontOfSize:9];
    [retrieveCodeButton addTarget:self action:@selector(retrieveCodeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:retrieveCodeButton];
    [retrieveCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(smsCodeTextView.mas_bottom);
        make.height.offset(45);
        make.left.mas_equalTo(smsCodeTextView.mas_right).offset(10);
        make.right.mas_equalTo(self.view).offset(-15);
    }];
    self.retrieveCodeButton = retrieveCodeButton;
    
    
    //昵称
    LHTextFieldView *usernameTextView = [[LHTextFieldView alloc]init];
    [self.view addSubview:usernameTextView];
    [usernameTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(smsCodeTextView.mas_bottom).offset(25);
        make.left.mas_equalTo(self.view).offset(15);
        make.right.mas_equalTo(self.view).offset(-15);
        make.height.offset(45);
    }];
    usernameTextView.titleLabel.text = @"昵称：";
    usernameTextView.textField.placeholder = @"取个响亮的名字吧";
    self.usernameTextView = usernameTextView;
    
    //密码
    LHTextFieldView *passwordTextView = [[LHTextFieldView alloc]init];
    [self.view addSubview:passwordTextView];
    [passwordTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(usernameTextView.mas_bottom).offset(25);
        make.left.mas_equalTo(self.view).offset(15);
        make.right.mas_equalTo(self.view).offset(-15);
        make.height.offset(45);
    }];
    //设置为密码类型
    [passwordTextView.textField setSecureTextEntry:YES];
    //键盘类型
    passwordTextView.textField.keyboardType = UIKeyboardTypeASCIICapable;
    passwordTextView.titleLabel.text = @"密码：";
    passwordTextView.textField.placeholder = @"6-12位数字或字母的组合";
    self.passwordTextView = passwordTextView;
    
    //完成按钮
    UIButton *completeButton = [[UIButton alloc]init];
    [completeButton setTitle:@"完成" forState:UIControlStateNormal];
    completeButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [completeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.completeButton = completeButton;
    [self.view addSubview:completeButton];
    [completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordTextView.mas_bottom).offset(25);
        make.left.width.height.mas_equalTo(passwordTextView);
    }];
    [completeButton addTarget:self action:@selector(completeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    //控制器打开，默认开始倒计时
    
    [self.smsCodeTextView.textField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.usernameTextView.textField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.passwordTextView.textField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    //默认调用一次文本框内容发生改变的方法
    [self textChange];
    
}


//当文本框内容发生改变时调用
- (void)textChange{
    self.completeButton.enabled = self.smsCodeTextView.textField.text.length && self.usernameTextView.textField.text.length && self.passwordTextView.textField.text.length;
}

//设置导航条
- (void)setupNavBar{
    
    self.title = @"注册";

}


//发送验证码
-(void)retrieveCodeButtonClick {
    

     
    
    
}

//点击完成按钮
-(void)completeButtonClick {
    NSLog(@"完成");
    
    //密码
    NSString *password = self.passwordTextView.textField.text;
    //昵称
    NSString *username = self.usernameTextView.textField.text;
    //输入的验证码
    NSString *smsCode = self.smsCodeTextView.textField.text;
    
    NSLog(@"%@",smsCode);
    
       
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 触摸屏幕键盘回收
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
