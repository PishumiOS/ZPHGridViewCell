//
//  ZPHGrideViewCell.h
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZPHGrideItemView.h"

@interface ZPHGrideViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray<ZPHGrideItemView*> *cellViewItems;

+ (ZPHGrideViewCell *)initZPHGrideViewCellWithRow:(NSInteger)row;

- (ZPHGrideViewCell*) setItemViewDataWithArray:(NSMutableArray *)array IndexPath:(NSIndexPath*)indexPath Delegate:(id<ZPHGrideItemViewDelegate>)delegate Rownums:(NSInteger)rownums;
@end
