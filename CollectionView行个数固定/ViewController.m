//
//  ViewController.m
//  CollectionView行个数固定
//
//  Created by Pishum on 16/8/10.
//  Copyright © 2016年 Leleda. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGRect rect = [[UIScreen mainScreen] bounds];
    
    return (rect.size.width - 40)/4.0;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
//    CGRect rect = [[UIScreen mainScreen] bounds];
//    
//     CGFloat height = (rect.size.width - 40)/4.0;
    return cell;
}
@end
