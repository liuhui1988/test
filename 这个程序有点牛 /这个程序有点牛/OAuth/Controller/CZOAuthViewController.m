//
//  CZOAuthViewController.m
//  传智微博
//
//  Created by apple on 15-3-8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CZOAuthViewController.h"
#import "LHTabBarController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"

#import "CZAccount.h"
#import "CZAccountTool.h"

#define CZAuthorizeBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define CZClient_id     @"896848682"
#define CZRedirect_uri  @"http://www.baidu.com"
#define CZClient_secret @"e920682b3b5bd4448e363b7e88bff1e5"




@interface CZOAuthViewController ()<UIWebViewDelegate>

@end

@implementation CZOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 展示登陆的网页 -> UIWebView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    // 加载网页
    
    // 一个完整的URL:基本URL + 参数
    // https://api.weibo.com/oauth2/authorize?client_id=&redirect_uri=
    
    NSString *baseUrl = @"https://api.weibo.com/oauth2/authorize";
    NSString *client_id = @"896848682";
    NSString *redirect_uri = @"http://www.baidu.com";
    
    // 拼接URL字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",baseUrl,client_id,redirect_uri];
    
    // 创建URL
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 加载请求
    [webView loadRequest:request];
    
    // 设置代理
    webView.delegate = self;

}

#pragma mark -UIWebView代理
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // 提示用户正在加载...
    [MBProgressHUD showMessage:@"正在加载..."];
}

// webview加载完成的时候调用
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

//  webview加载失败的时候调用
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

// 拦截webView请求
// 当Webview需要加载一个请求的时候，就会调用这个方法，询问下是否请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    
    // 获取code(RequestToken)
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) { // 有code=
        
        // code=81524df3190ea6e58e33c9a0eba1ac56
        // 0 + length
        
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        // 换取accessToken
        [self accessTokenWithCode:code];
        
        // 不会去加载回调界面
        return NO;
        
    }
    
    return YES;
}
/*
 
 必选	类型及范围	说明
 client_id	true	string	申请应用时分配的AppKey。
 client_secret	true	string	申请应用时分配的AppSecret。
 grant_type	true	string	请求的类型，填写authorization_code
 
 grant_type为authorization_code时
 必选	类型及范围	说明
 code	true	string	调用authorize获得的code值。
 redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
 
 */
#pragma mark - 换取accessToken
- (void)accessTokenWithCode:(NSString *)code
{
    // 发送Post请求
    
    // 创建请求管理者作用:请求和解析
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = CZClient_id;
    params[@"client_secret"] = CZClient_secret;
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = CZRedirect_uri;
    
    // 发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) { // 请求成功的时候调用
        
        // 字典转模型
        CZAccount *account = [CZAccount accountWithDict:responseObject];

        // 保存账号信息:
        // 数据存储一般我们开发中会搞一个业务类，专门处理数据的存储
        // 以后我不想归档，用数据库，直接改业务类
        [CZAccountTool saveAccount:account];
        
        LHTabBarController * tabar =[[LHTabBarController alloc]init];
        
        [UIApplication sharedApplication].keyWindow.rootViewController=tabar;
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) { // 请求失败的时候调用
        
    }];
}
/*
 "access_token" = "2.00rgrSmFbkehbC7e6d1c76a9ZumKNB";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 5294424581;
 
 "access_token" = "2.00rgrSmFbkehbC7e6d1c76a9ZumKNB";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 5294424581;
 */

/*
 Request failed: unacceptable content-type: text/plain"
 content-type:
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
