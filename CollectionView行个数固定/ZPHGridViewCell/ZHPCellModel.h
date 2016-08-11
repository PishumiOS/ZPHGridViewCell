//
//  ZHPCellModel.h
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/11.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHPCellModel : NSObject
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *labelText;

+ (ZHPCellModel*)initZHPCellModelWithImgName:(NSString*)imagname Label:(NSString*)labelText;
@end
