//
//  LHHelpViewController.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/25.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHHelpViewController.h"
#import "LHHtmlPage.h"
#import "LSMenuItemGroup.h"
#import "LHWebViewController.h"
#import "LSMenuArrowItem.h"

@interface LHHelpViewController ()

@property(nonatomic,strong)NSArray *htmls;

@end

@implementation LHHelpViewController

-(NSArray *)htmls{
    if (!_htmls) {
        //从help.json加载数据
        
        //1.获取json路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        //2.把json转成NSData
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        //3.再把NSData转成数组
        
        //json的序列化 "就是把数据转成字典/数组"
        NSArray *helpArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"%@",obj);
        
        //4.遍历数组里字典，转成模型
        NSMutableArray *htmlsM =[NSMutableArray array];
        for (NSDictionary *dict in helpArr) {
            LHHtmlPage *htmlPage = [LHHtmlPage htmlPageWithDict:dict];
            [htmlsM addObject:htmlPage];
        }
        
        _htmls = htmlsM;
    }
    
    return _htmls;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.htmls);
    
    //把htmls的数据转成cellData显示的数据
    LSMenuItemGroup *group = [[LSMenuItemGroup alloc] init];
    
    
    NSMutableArray *items = [NSMutableArray array];
    for (LHHtmlPage *htmlPage in self.htmls) {
        LSMenuArrowItem *item = [LSMenuArrowItem itemWithIcon:nil title:htmlPage.title];
        [items addObject:item];
    }
    group.items = items;
    
    [self.cellData addObject:group];
    
    
    //如果要在应用里显示的网页
    //使用一个叫UIWebView控件，这个控制就能显示网页
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //进入一个叫 “网页的控制器”
    
    // 1.创建一个导航控制器,设置它的子控制器为 “网页的控制器”
    LHWebViewController *webVc = [[LHWebViewController alloc] init];
    
    // 设置模型数据
    webVc.htmlPage = self.htmls[indexPath.row];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVc];
    
    
    // 2.以模态窗口的方式来打开控制器
    [self presentViewController:nav animated:YES completion:nil];
    
    
}



@end
