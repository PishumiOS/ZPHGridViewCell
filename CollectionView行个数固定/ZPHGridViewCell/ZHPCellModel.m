//
//  ZHPCellModel.m
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/11.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import "ZHPCellModel.h"

@implementation ZHPCellModel
+ (ZHPCellModel*)initZHPCellModelWithImgName:(NSString*)imagname Label:(NSString*)labelText{
    
    ZHPCellModel *cellModel = [[ZHPCellModel alloc]init];
    cellModel.imageName = imagname;
    cellModel.labelText = labelText;
    
    return cellModel;
    
}
@end
