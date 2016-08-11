//
//  ViewController.m
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import "ViewController.h"


#import "GrideCell.h"
#import "ZPHGrideViewCell.h"
#import "ZHPCellModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,ZPHGrideItemViewDelegate>

{
    CGFloat cellHeight;
    NSInteger rowItem;//一行显示个数
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *labelArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _labelArray = [[NSMutableArray alloc]init];
    
    ZHPCellModel *cellModel1 = [ZHPCellModel initZHPCellModelWithImgName:@"tab_home_view_select@2x" Label:@"刘备"];
    ZHPCellModel *cellModel2 = [ZHPCellModel initZHPCellModelWithImgName:@"tab_home_view_select@2x" Label:@"关羽"];
    ZHPCellModel *cellModel3 = [ZHPCellModel initZHPCellModelWithImgName:@"tab_home_view_select@2x" Label:@"张飞"];
    ZHPCellModel *cellModel4 = [ZHPCellModel initZHPCellModelWithImgName:@"tab_home_view_select@2x" Label:@"赵云"];
    ZHPCellModel *cellModel5 = [ZHPCellModel initZHPCellModelWithImgName:@"tab_home_view_select@2x" Label:@"黄忠"];
    ZHPCellModel *cellModel6 = [ZHPCellModel initZHPCellModelWithImgName:@"tab_home_view_select@2x" Label:@"马超"];
    ZHPCellModel *cellModel7 = [ZHPCellModel initZHPCellModelWithImgName:@"tab_home_view_select@2x" Label:@"孔明"];
    _labelArray = [@[cellModel1,cellModel2,cellModel3,cellModel4,cellModel5,cellModel6,cellModel7] copy];
    
    rowItem = 4;
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;//去掉分割线
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    return cellHeight + 1;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if([_labelArray count] % rowItem == 0){
        return ([_labelArray count] / rowItem);
    }else{
        return ([_labelArray count] / rowItem) + 1;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZPHGrideViewCell *cell = [ZPHGrideViewCell initZPHGrideViewCellWithRow:rowItem TableViewFrame:tableView.frame];
    cellHeight = cell.frame.size.height;
    
    cell = [cell setItemViewDataWithArray:_labelArray IndexPath:indexPath Delegate:self Rownums:rowItem];
    
    return cell;
}

//GrideItemViewDelegate
- (void)OnZPHGrideItemViewClicked:(ZPHGrideItemView *)itemView{
    NSLog(@"点击了这里%d",itemView.tag);
}
@end
