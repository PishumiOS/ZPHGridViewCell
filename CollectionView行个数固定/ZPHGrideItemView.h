//
//  ZPHGrideItemView.h
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPHGrideItemView;

@protocol ZPHGrideItemViewDelegate <NSObject>

@optional
-(void)OnZPHGrideItemViewClicked:(ZPHGrideItemView *)itemView;

@end

@interface ZPHGrideItemView : UIView

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, weak) id<ZPHGrideItemViewDelegate> delegate;


+ (ZPHGrideItemView *)initZPHGrideItemViewWithImgView:(UIImageView*)img Label:(UILabel*)label;


@end
