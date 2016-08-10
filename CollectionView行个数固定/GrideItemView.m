//
//  GrideItemView.m
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import "GrideItemView.h"

@implementation GrideItemView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (GrideItemView *)initGrideItemViewWithImgView:(UIImageView*)img Label:(UILabel*)label{
    GrideItemView *itemView = [[GrideItemView alloc]init];
    
    itemView.imageView = img;
    itemView.label = label;

//    img.image = [UIImage imageNamed:@"tab_home_view_select@2x"];
//    label.text = @"qwwewe";
    
    [itemView setOnClickedListener];
    
    [itemView addSubview:img];
    [itemView addSubview:label];
    

    
    return itemView;
}


- (void) setOnClickedListener{
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnClickedItem)];
    [self addGestureRecognizer:gesture];
}




- (void)OnClickedItem{
    if ([self.delegate respondsToSelector:@selector(OnGrideItemViewClicked:)]) {
        [self.delegate OnGrideItemViewClicked:self];
    }
}


@end
