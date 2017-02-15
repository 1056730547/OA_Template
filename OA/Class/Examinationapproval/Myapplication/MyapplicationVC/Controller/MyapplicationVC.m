//
//  MyapplicationVC.m
//  OA
//
//  Created by zzbf on 16/12/15.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "MyapplicationVC.h"
#import "WorkorderCell.h"
#import "ExaminappDetailVC.h"

@interface MyapplicationVC ()<UITableViewDelegate, UITableViewDataSource>



@end

@implementation MyapplicationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_MyTable registerNib:[UINib nibWithNibName:@"WorkorderCell" bundle:nil] forCellReuseIdentifier:@"cellid"];
    _MyTable.tableFooterView = [UIView new];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid             = @"cellid";
    
    WorkorderCell   *cell               = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if ( !cell ) {
        
        cell                            = [[[NSBundle mainBundle]loadNibNamed:@"WorkorderCell" owner:nil options:nil]lastObject];
    }
    
    cell.ODetail.text = @"签发人: Boss";
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ExaminappDetailVC *file = [[ExaminappDetailVC alloc]initWithNibName:@"ExaminappDetailVC" bundle:nil];
    if (indexPath.row % 2 == 0) {
        file.Type = @"1";
    } else {
        file.Type = @"2";
    }

    
    [self.navigationController pushViewController:file animated:YES];
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}




@end
