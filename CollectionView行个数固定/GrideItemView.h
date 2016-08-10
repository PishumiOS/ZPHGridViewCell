//
//  GrideItemView.h
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GrideItemView;

@protocol GrideItemViewDelegate <NSObject>

@optional
-(void)OnGrideItemViewClicked:(GrideItemView *)itemView;

@end

@interface GrideItemView : UIView

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, weak) id<GrideItemViewDelegate> delegate;


+ (GrideItemView *)initGrideItemViewWithImgView:(UIImageView*)img Label:(UILabel*)label;


@end
