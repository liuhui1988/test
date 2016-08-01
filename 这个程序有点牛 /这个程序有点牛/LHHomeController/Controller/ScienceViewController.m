//
//  ScienceViewController.m
//  网易新闻
//
//  Created by xiaomage on 15/10/23.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ScienceViewController.h"
#import "LHProduce.h"
#import "LHCollectionCell.h"

#define ScreenX  [UIScreen mainScreen].bounds.size.width/5

#define ScreenY  [UIScreen mainScreen].bounds.size.height/4

@interface ScienceViewController ()

@property(nonatomic,strong)NSArray *products;

@end

@implementation ScienceViewController

-(NSArray *)products{
    if (!_products) {
        //1.获取json路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        
        //2.把json转成NSData
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        //3.再把NSData转成数组
        
        //json的序列化 "就是把数据转成字典/数组"
        NSArray *productArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"%@",obj);
        
        //4.遍历数组里字典，转成模型
        NSMutableArray *productsM =[NSMutableArray array];
        for (NSDictionary *dict in productArr) {
            LHProduce *product = [LHProduce productWithDict:dict];
            [productsM addObject:product];
        }
        
        _products = productsM;
        
    }
    
    return _products;
}


static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
#warning UICollectionViewController初始化的时候，需要一个 "布局参数"
    //流水布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    if (self = [super initWithCollectionViewLayout:flowLayout]) {
        
        //最终的cell的大小，是由 流水布局 决定，由xib是决定不了
        //设置cell的尺寸
        flowLayout.itemSize = CGSizeMake(ScreenX, ScreenY);
        
        
        //设置cell的行的间距
        flowLayout.minimumLineSpacing = 50;
        
        //设置cell的列间距
        //flowLayout.minimumInteritemSpacing = 50;
        
        
        //设置section的四边距
        flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cell classes
    //注册一个可循环引用的cell
    //[self.collectionView registerClass:[CZProductCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LHCollectionCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}




#pragma mark <UICollectionViewDataSource>
//组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//组里个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //设置模型
    cell.product = self.products[indexPath.row];
    
    return cell;
}


#pragma mark cell的选中
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
