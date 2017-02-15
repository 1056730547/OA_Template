//
//  FileVC.m
//  OA
//
//  Created by zzbf on 16/12/15.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "FileVC.h"
#import "WorkorderCell.h"
#import "FiledetailVC.h"

@interface FileVC ()<UITableViewDelegate, UITableViewDataSource>



@end

@implementation FileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"文档";
    
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
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FiledetailVC *file = [[FiledetailVC alloc]initWithNibName:@"FiledetailVC" bundle:nil];
    [self.navigationController pushViewController:file animated:YES];
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}




@end
