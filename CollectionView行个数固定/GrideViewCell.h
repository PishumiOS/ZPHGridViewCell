//
//  GrideViewCell.h
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GrideItemView.h"

@interface GrideViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray<GrideItemView*> *cellViewItems;

+ (GrideViewCell *)initGrideViewCellWithRow:(NSInteger)row;

- (GrideViewCell*) setItemViewDataWithArray:(NSMutableArray *)array IndexPath:(NSIndexPath*)indexPath Delegate:(id<GrideItemViewDelegate>)delegate Rownums:(NSInteger)rownums;
@end
