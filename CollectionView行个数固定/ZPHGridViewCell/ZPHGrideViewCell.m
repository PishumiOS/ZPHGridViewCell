//
//  ZPHGrideViewCell.m
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import "ZPHGrideViewCell.h"
#import "ZHPCellModel.h"



//static CGFloat kHorSapaceing = 20.0;
//static CGFloat kLabelHeight = 30.0;

@implementation ZPHGrideViewCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (ZPHGrideViewCell *)initZPHGrideViewCellWithRow:(NSInteger)row TableViewFrame:(CGRect)tableViewFrame{
    ZPHGrideViewCell *cell = [[ZPHGrideViewCell alloc]init];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    
//    CGRect mainRect = [[UIScreen mainScreen] bounds];
    
    CGFloat kHorSapaceing = 1.0;
    CGFloat kLabelHeight = tableViewFrame.size.width /row / 3.0;
    CGFloat kVerSpaceing = tableViewFrame.size.width / row / 10.0;
    
    //每个item的宽度,宽高相同
    CGFloat itemWidth = (tableViewFrame.size.width - (row + 1) * kHorSapaceing)/row;
    
    CGRect cellBound = CGRectMake(0, 0, tableViewFrame.size.width, itemWidth);
    
    cell.frame = cellBound;
    cell.cellViewItems = [[NSMutableArray<ZPHGrideItemView*> alloc]init];
    
    CGFloat cellImageHeight = itemWidth - kLabelHeight - kVerSpaceing -5;
    
    NSLog(@"itemWidth=%f cellImageHeight=%f",itemWidth,cellImageHeight);
    for (int index = 0; index < row; index++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((itemWidth - cellImageHeight)/2.0, kVerSpaceing, cellImageHeight, cellImageHeight)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, kVerSpaceing + cellImageHeight, itemWidth, kLabelHeight)];
        
        
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        CGFloat labelTextSize = 16 - row;
        if (labelTextSize <= 5 ){
            labelTextSize = 5;
        }
        
        [label setFont:[UIFont systemFontOfSize:labelTextSize]];
        
        
        ZPHGrideItemView *itemBgView = [ZPHGrideItemView initZPHGrideItemViewWithImgView:imageView Label:label];
        
        CGRect itemBgFrame = CGRectMake(kHorSapaceing * (index+1) + index * itemWidth, 0, itemWidth, itemWidth);
        itemBgView.frame = itemBgFrame;
        
        itemBgView.backgroundColor = [UIColor whiteColor];
        
        [cell.cellViewItems addObject:itemBgView];
        
        [cell addSubview:itemBgView];
        
    }
    return cell;
}



- (ZPHGrideViewCell*) setItemViewDataWithArray:(NSMutableArray<ZHPCellModel*> *)array IndexPath:(NSIndexPath*)indexPath Delegate:(id<ZPHGrideItemViewDelegate>)delegate Rownums:(NSInteger)rownums{
    
    for (int index = 0; index < rownums; index++) {
        ZPHGrideItemView *itemView = self.cellViewItems[index];
        
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
