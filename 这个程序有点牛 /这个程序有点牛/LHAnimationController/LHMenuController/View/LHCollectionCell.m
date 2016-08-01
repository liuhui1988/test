//
//  LHCollectionCell.m
//  这个程序有点牛
//
//  Created by 刘辉 on 16/6/25.
//  Copyright © 2016年 刘辉. All rights reserved.
//

#import "LHCollectionCell.h"
#import "LHProduce.h"


@interface LHCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end


@implementation LHCollectionCell
- (void)awakeFromNib {
    // Initialization code
    // 剪切圆角
#warning awakeFormNid这个方法之后，连线才完成
    self.imageView.layer.cornerRadius = 15;
    self.imageView.layer.masksToBounds = YES;
}


-(void)setProduct:(LHProduce *)product{
    _product = product;
    
    //设置图片
    self.imageView.image = [UIImage imageNamed:product.icon];
    
    //设置产品的名称
    self.nameLabel.text = product.title;
    
   
}

@end
