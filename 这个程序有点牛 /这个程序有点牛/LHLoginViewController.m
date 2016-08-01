//
//  LHLoginViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/7/5.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHLoginViewController.h"
#import "LHRegisterViewController.h"
#import "LHForgetViewController.h"
#import "LHTextFieldView.h"
#import "Masonry.h"

@interface LHLoginViewController ()<UITextFieldDelegate>

//手机号码TxF
@property(nonatomic,weak) LHTextFieldView *phoneTextView;
//密码TxF
@property(nonatomic,weak) LHTextFieldView *pwdTextView;
//完成按钮
@property(nonatomic,weak) UIButton *completeButton;

@end

@implementation LHLoginViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //设置导航条
    [self setupNavBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    
    //手机号码
    LHTextFieldView *phoneTextView = [[LHTextFieldView alloc]init];
    [self.view addSubview:phoneTextView];
    [phoneTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(100);
        make.left.mas_equalTo(self.view).offset(15);
        make.right.mas_equalTo(self.view).offset(-15);
        make.height.offset(45);
    }];
    phoneTextView.titleLabel.text = @"手机号：";
    phoneTextView.textField.placeholder = @"请输入手机号码";
    //键盘类型为数字键盘
    phoneTextView.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTextView = phoneTextView;
    
    //密码
    LHTextFieldView *pwdTextView = [[LHTextFieldView alloc]init];
    [self.view addSubview:pwdTextView];
    [pwdTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneTextView.mas_bottom).offset(25);
        make.left.width.height.mas_equalTo(phoneTextView);
    }];
    pwdTextView.titleLabel.text = @"密码：";
    pwdTextView.textField.placeholder = @"请输入登录密码";
    //设置为密码类型
    [pwdTextView.textField setSecureTextEntry:YES];
    //键盘类型
    pwdTextView.textField.keyboardType = UIKeyboardTypeASCIICapable;
    self.pwdTextView = pwdTextView;
    
    
    //忘记密码
    UIButton *forgetPasswordButton = [[UIButton alloc]init];
    [forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPasswordButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:forgetPasswordButton];
    [forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(pwdTextView.mas_bottom).offset(5);
        make.right.mas_equalTo(pwdTextView);
      
    }];
    [forgetPasswordButton addTarget:self action:@selector(forgetPasswordButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    //完成按钮
    UIButton *completeButton = [[UIButton alloc]init];
    [completeButton setTitle:@"登录" forState:UIControlStateNormal];
    completeButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [completeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     self.completeButton = completeButton;
    [self.view addSubview:completeButton];
    [completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(forgetPasswordButton.mas_bottom).offset(25);
        make.left.width.height.mas_equalTo(phoneTextView);
        
    }];
    [completeButton addTarget:self action:@selector(completeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
  
    
    [self.phoneTextView.textField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextView.textField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    //默认调用一次文本框内容发生改变的方法
    [self textChange];
    
}


//当文本框内容发生改变时调用
- (void)textChange{
    self.completeButton.enabled = self.phoneTextView.textField.text.length && self.pwdTextView.textField.text.length ;
}


//设置导航条
- (void)setupNavBar{
    
    self.title = @"登录";
    
    //导航栏右上（注册）
    UIView *navRightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 60)];
    UIButton *registerBtn =[[UIButton alloc]initWithFrame:navRightView.frame];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    registerBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [registerBtn addTarget:self action:@selector(registerbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navRightView addSubview:registerBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navRightView];
    
}


//跳转注册控制器
-(void)registerbtnClick {
    [self.view endEditing:YES];
    //    NSLog(@"...");
    LHRegisterViewController *registerVC = [[LHRegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}



//成功登录并就获取到了AccessToken
-(void)loginSussess {
    
    NSLog(@"登陆成功了");
    
    //跳转到上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)forgetPasswordButtonClick{
    
    LHForgetViewController * forgetbtn =[[LHForgetViewController alloc]init];
    
    forgetbtn.title=@"忘记密码";
    
    [self.navigationController pushViewController:forgetbtn animated:YES];
}

-(void)completeButtonClick{
    
}


#pragma mark - 触摸屏幕键盘回收
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}






@end
