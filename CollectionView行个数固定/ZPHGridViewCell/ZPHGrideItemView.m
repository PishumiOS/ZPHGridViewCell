//
//  ZPHGrideItemView.m
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import "ZPHGrideItemView.h"

@implementation ZPHGrideItemView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (ZPHGrideItemView *)initZPHGrideItemViewWithImgView:(UIImageView*)img Label:(UILabel*)label{
    ZPHGrideItemView *itemView = [[ZPHGrideItemView alloc]init];
    
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
    if ([self.delegate respondsToSelector:@selector(OnZPHGrideItemViewClicked:)]) {
        [self.delegate OnZPHGrideItemViewClicked:self];
    }
}


@end
