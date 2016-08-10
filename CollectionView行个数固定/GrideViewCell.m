//
//  GrideViewCell.m
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import "GrideViewCell.h"
#import "ZHPCellModel.h"



static CGFloat kHorSapaceing = 20.0;
static CGFloat kLabelHeight = 30.0;

@implementation GrideViewCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (GrideViewCell *)initGrideViewCellWithRow:(NSInteger)row{
    GrideViewCell *cell = [[GrideViewCell alloc]init];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    
    //每个item的宽度,宽高相同
    CGFloat itemWidth = (mainRect.size.width - (row + 1) * kHorSapaceing)/row;
    
    CGRect cellBound = CGRectMake(0, 0, mainRect.size.width, itemWidth);
    
    cell.frame = cellBound;
    cell.cellViewItems = [[NSMutableArray<GrideItemView*> alloc]init];
    
    CGFloat cellImageHeight = itemWidth - kLabelHeight - kHorSapaceing -5;
    
    NSLog(@"itemWidth=%f cellImageHeight=%f",itemWidth,cellImageHeight);
    for (int index = 0; index < row; index++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((itemWidth - cellImageHeight)/2.0, kHorSapaceing, cellImageHeight, cellImageHeight)];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, kHorSapaceing + cellImageHeight, itemWidth, kLabelHeight)];
        
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kHorSapaceing, kHorSapaceing, cellImageHeight, cellImageHeight)];
//        
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, kHorSapaceing + cellImageHeight, itemWidth, kLabelHeight)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        
        
        
        
        GrideItemView *itemBgView = [GrideItemView initGrideItemViewWithImgView:imageView Label:label];
        
        CGRect itemBgFrame = CGRectMake(kHorSapaceing * (index+1) + index * itemWidth, 0, itemWidth, itemWidth);
        itemBgView.frame = itemBgFrame;
        
        itemBgView.backgroundColor = [UIColor greenColor];
        
        
        [cell.cellViewItems addObject:itemBgView];
        
        [cell addSubview:itemBgView];
        
    }
    return cell;
}



- (GrideViewCell*) setItemViewDataWithArray:(NSMutableArray<ZHPCellModel*> *)array IndexPath:(NSIndexPath*)indexPath Delegate:(id<GrideItemViewDelegate>)delegate Rownums:(NSInteger)rownums{
    
    for (int index = 0; index < rownums; index++) {
        GrideItemView *itemView = self.cellViewItems[index];
        
        int cursor = (int)(indexPath.row * rownums + index);
        if (cursor < [array count]){
            
            ZHPCellModel *cellModel = array[cursor];
            
            itemView.label.text =  cellModel.labelText;
            itemView.imageView.image = [UIImage imageNamed:cellModel.imageName];
            itemView.tag = cursor;
            itemView.delegate = delegate;
        }
    }
    
    return self;
}
@end
